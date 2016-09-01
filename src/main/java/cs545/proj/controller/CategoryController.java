package cs545.proj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import cs545.proj.domain.Member;
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
    public @ResponseBody Category saveCategory( @Valid  @RequestBody Category category) {
 
         categoryService.saveOrUpdate(category);
         return category;
    }
    

	@RequestMapping(value="/edit/{id}", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String getEditCatalogForm(@PathVariable("id") int id, Model model) {
		Category category = categoryService.getCategoryById(id);
		model.addAttribute("category", category );
		   return "editCategory";
		}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String categoryupdate(@ModelAttribute("newMember") @Valid Category categoryToBeEdited, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "editCategory";
		}
		categoryService.saveOrUpdate(categoryToBeEdited);
	   	return "redirect:/categoryList";
	}

}