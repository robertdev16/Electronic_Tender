<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<div id="centerDiv">

		<div>
			<h1>Subscription to Electronic-Tender</h1>
			<p>Subscription to Electronic-Tender will ultimately give you and your
				company the account [username and password] to follow tenders online
				on our website. Getting your account is very simple and could be
				done in two simple steps.</p>
		</div>
		
		
		<div>
			<h1>Step 1 Create Your Account Online</h1>
			<p>
			    Register online by filling out the subscription form and create your 
			    company's account on our website. Only simple information required like 
			    your company name, email, telephone and your own username and password. 
			    Go ahead and create your account by clicking the button below.
			</p>
			<a href="<spring:url value='/member/register' />" >CREATE YOUR ACCOUNT</a>
		</div>


		<div>
			<h1>Step 2 Make Your Payment</h1>
			<p>Once you are finished with creating your accounts above, you
				are one step closer to finish up your subscription. Your account
				will be inactive until you activate it by settling your annual
				subscription fee.</p>
			<a href="<spring:url value='/payment' />">MAKE PAYMENT</a>
		</div>
	</div>