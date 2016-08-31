package cs545.proj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

import cs545.proj.domain.dto.DomainError;
import cs545.proj.domain.dto.DomainErrors;

@ControllerAdvice
public class ControllerExceptionHandler {

	@Autowired
	MessageSourceAccessor messageAccessor;

	@ExceptionHandler(value = AccessDeniedException.class)
	public String accessDenied() {
		return "error-forbidden";
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public DomainErrors handleException(MethodArgumentNotValidException exception) {
		List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();

		DomainErrors errors = new DomainErrors();
		errors.setErrorType("ValidationError");
		for (FieldError fieldError : fieldErrors) {
			DomainError error = new DomainError(messageAccessor.getMessage(fieldError));
			errors.addError(error);
		}

		return errors;
	}

	@ExceptionHandler(value = Exception.class)
	public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
		// If the exception is annotated with @ResponseStatus rethrow it and let
		// the framework handle it - like the OrderNotFoundException example
		// at the start of this post.
		// AnnotationUtils is a Spring Framework utility class.
		if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) != null)
			throw e;

		// Otherwise setup and send the user to a default error-view.
		ModelAndView mav = new ModelAndView();
		if (e instanceof MaxUploadSizeExceededException) {
			mav.addObject("maxSizeException", true);
		}
		mav.addObject("exception", e);
		mav.addObject("url", req.getRequestURL());
		mav.setViewName("errorTile");
		return mav;
	}

}
