package cs545.proj.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cs545.proj.domain.Category;
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

}