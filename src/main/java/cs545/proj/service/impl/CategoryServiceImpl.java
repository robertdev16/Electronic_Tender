package cs545.proj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs545.proj.domain.Category;
import cs545.proj.repository.CategoryRepository;
import cs545.proj.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<Category> listAllCategories() {
		return categoryRepository.findAll();
	}

	@Override
	public Category saveOrMerge(Category category) {
		return categoryRepository.saveAndFlush(category);
	}

	@Override
	public Category getCategoryById(int categoryId) {
		return categoryRepository.findOne(categoryId);
	}

}
