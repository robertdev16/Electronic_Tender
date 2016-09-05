package cs545.proj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cs545.proj.domain.Category;
import cs545.proj.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listMembers(Model model) {
		model.addAttribute("categories", categoryService.listAllCategories());
		return "categoryListTile";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody Category saveCategory(@Valid @RequestBody Category category) {

		categoryService.saveOrMerge(category);
		return category;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String getEditCatalogForm(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", categoryService.getCategoryById(id));
		return "editCategoryTile";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String categoryupdate(@Valid @ModelAttribute("category") Category category, BindingResult result,
			HttpServletRequest request) {
		if (result.hasErrors()) {
			return "editCategoryTile";
		}

		Category oldCategory = categoryService.getCategoryById(category.getId());
		oldCategory.setName(category.getName());
		oldCategory.setDescription(category.getDescription());
		categoryService.saveOrMerge(oldCategory);
		return "redirect:/category/all";
	}
}