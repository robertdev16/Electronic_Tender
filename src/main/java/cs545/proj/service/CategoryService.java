package cs545.proj.service;

import java.util.List;

import cs545.proj.domain.Category;
 
public interface CategoryService {

	public List<Category> listAllCategories();
	
	public Category getCategoryById(int categoryId);
	
	public Category saveOrMerge(Category category);

}
