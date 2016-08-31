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
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

  // @Valid - but NO BindResult! an exception will be thrown...
    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    public @ResponseBody Category saveCategory( @Valid  @RequestBody Category category) {
 
         categoryService.saveOrUpdate(category);
         return category;
    }
    

	@RequestMapping("/category_edit/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')") 
	public String getEditCatalogForm(@PathVariable("id") int id, Model model) {
		Category category = categoryService.getCategoryById(id);
		model.addAttribute("catagory", category );
		   return "editCategory";
		}
	
	@RequestMapping(value="/member_update" ,method = RequestMethod.POST)
//	@PreAuthorize("hasRole('ROLE_ADMIN')") 
	public String categoryupdate(@ModelAttribute("newMember") @Valid Category categoryToBeEdited, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "editCategory";
		}
		categoryService.saveOrUpdate(categoryToBeEdited);
	   	return "redirect:/categoryList";
	}

}