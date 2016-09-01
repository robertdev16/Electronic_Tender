package cs545.proj.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import cs545.proj.domain.Category;
import cs545.proj.domain.Tender;
import cs545.proj.service.CategoryService;
import cs545.proj.service.TenderService;

@Controller
@RequestMapping("/tender")
public class TenderController {

	@Autowired
	private TenderService tenderService;

	@Autowired
	private CategoryService categoryService;

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

	private static String attachmentPath = "/resources/images/attached/";

	@ModelAttribute
	public void prepareCategories(Model model) {
		model.addAttribute("categories", categoryService.listAllCategories());
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listTenders(Model model) {
		model.addAttribute("tenders", tenderService.listAllTenders());
		return "tenderListTile";
	}

	@RequestMapping(value = "/byCategory/{categoryId}", method = RequestMethod.GET)
	public String getTendersByCategoryId(@PathVariable("categoryId") int categoryId, Model model) {
		Category category = categoryService.getCategoryById(categoryId);
		model.addAttribute("tenders", (category == null) ? null : category.getTenderList());
		return "tenderListTile";
	}

	@RequestMapping(value = "/detail/{tenderId}", method = RequestMethod.GET)
	public String getTenderById(@PathVariable("tenderId") int tenderId, Model model) {
		model.addAttribute("tender", tenderService.getTenderById(tenderId));
		return "tenderTile";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String getAddNewTenderForm(@ModelAttribute("newTender") Tender newTender, Model model) {
		Map<Integer, String> categoryMap = new LinkedHashMap<Integer, String>();
		for (Category category : categoryService.listAllCategories()) {
			categoryMap.put(category.getId(), category.getName());
		}
		model.addAttribute("categoryMap", categoryMap);
		return "postTenderTile";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String processAddNewTenderForm(@Valid @ModelAttribute("newTender") Tender newTender, BindingResult result,
			HttpSession session) throws IllegalStateException, IOException {

		if (result.hasErrors()) {
			return "postTenderTile";
		}
		
		Date nowTime = new Date();
		newTender.setPostDate(nowTime);
		String dateTimeStr = sdf.format(nowTime);
		newTender.setRefId("SFET-" + dateTimeStr);
		MultipartFile attachmentFile = newTender.getTenderMultipart();
		if ((attachmentFile != null) && (!attachmentFile.isEmpty())) {
			String newFilename = dateTimeStr + attachmentFile.getOriginalFilename();
			String rootDirectory = session.getServletContext().getRealPath("/");
			attachmentFile.transferTo(new File(rootDirectory + attachmentPath + newFilename));
			newTender.setAttachmentFileName(newFilename);
		}

		for (Integer categoryId : newTender.getCheckedCategoryIDs()) {
			newTender.addCategory(categoryService.getCategoryById(categoryId));
		}
		
		Tender savedTender = tenderService.saveOrUpdate(newTender);

		return "redirect:/tender/detail/" + savedTender.getId();

	}

}
