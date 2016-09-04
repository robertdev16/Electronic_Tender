package cs545.proj.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import cs545.proj.domain.Member;
import cs545.proj.repository.AccountRepository;

@Component
public class MemberRegisterValidator implements Validator {

	@Autowired
 	private AccountRepository accountRepository;
	
	@Override
	public boolean supports(Class<?> c) {
		return Member.class.isAssignableFrom(c);
	}

	@Override
	public void validate(Object command, Errors errors) {
		Member member = (Member) command;
		if (accountRepository.exists(member.getUser().getUsername()))
			errors.rejectValue("user.username", "Member.User.username.exist",
					"This username does exist, please try another email");
		if (! member.getUser().getPassword().equals(member.getUser().getConfirmPassword()))
			errors.rejectValue("user.confirmPassword", "Member.User.password.notSame",
					"Your password and confirm password are different");
	}

}
