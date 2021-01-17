package com.ch.s1.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.HtmlEmail;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ch.s1.util.Pager;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public int setMemberJoin(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberJoin(memberVO);
	}
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberLogin(memberVO);
	}
	
	public MemberVO getMemberId(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberId(memberVO);
	}
	
	public MemberVO getMemberPhone(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberPhone(memberVO);
	}
	
	public MemberVO getMemberEmail(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberEmail(memberVO);
	}
	
	public MemberVO getSearchId(MemberVO memberVO) throws Exception{
		return memberMapper.getSearchId(memberVO);
	}

	public MemberVO getMemberInfo(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberInfo(memberVO);
	}
	
	public int setMemberSecession(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberSecession(memberVO);
	}
	
	public int setMemberSelectSecession(Long mem_num) throws Exception{
		return memberMapper.setMemberSelectSecession(mem_num);
	}
	
	public int setModifyEmail(MemberVO memberVO) throws Exception{
		return memberMapper.setModifyEmail(memberVO);
	}
	
	public int setModifyPhone(MemberVO memberVO) throws Exception{
		return memberMapper.setModifyPhone(memberVO);
	}
	
	public List<MemberVO> getMemberList(Pager pager) throws Exception{
		pager.makeRow();
		long totalCount = memberMapper.getCount(pager);
		pager.makePage(totalCount);
		return memberMapper.getMemberList(pager);
	}
	
	public MemberVO getMemberOriginPw(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberOriginPw(memberVO);
	}
	
	public int setModifyPw(MemberVO memberVO) throws Exception{
		return memberMapper.setModifyPw(memberVO);
	}

	//비밀번호 찾기 이메일발송
	public void sendEmail(MemberVO memberVO, String div) throws Exception{
		
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";		//SMTP 서버명
		String hostSMTPid = "";
		String hostSMTPpwd = "";
		
		//보내는 사람
		String fromEmail = "";
		String fromName = "거북이의기적";
		
		String subject = ""; 	//메일 제목
		String msg = "";		//메일 내용
		
		if(div.equals("findpw")) {
			subject = "거북이의기적 임시 비밀번호 입니다.";
			msg += "<div align='center' style='width:300px; height: 500px; border:2px solid #00a5bd; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberVO.getMem_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberVO.getMem_pw() + "</p></div>";
		}
		
		//email 전송
		String mailRecipient =  memberVO.getMem_email(); //받는 사람 이메일 주소
		try {
			//객체 선언
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true); //SSL 사용 (TLS가 없는 경우에 SSL사용)
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465); 		//SMTP 포트 번호
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true); //TLS 사용
			mail.addTo(mailRecipient, charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일발송 실패 : " + e);
		}
	}
	

	//비밀번호찾기
	public void getfindPw(HttpServletResponse response, MemberVO memberVO) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		MemberVO chkId = new MemberVO();
		chkId.setMem_id(memberVO.getMem_id());
		chkId = memberMapper.getMemberId(chkId);
		
		MemberVO chkEmail = new MemberVO();
		chkEmail.setMem_email(memberVO.getMem_email());
		chkEmail = memberMapper.getMemberEmail(chkEmail);
		
		PrintWriter out = response.getWriter();
		if(chkId==null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(chkEmail==null) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}
		else {
			
			// 임시 비밀번호 생성
			String tempPw = UUID.randomUUID().toString().replace("-", ""); // -를 제거
			tempPw = tempPw.substring(0,10); //tempPw를 앞에서부터 10자리 잘라줌
			memberVO.setMem_pw(tempPw);
			
			// 비밀번호 변경
			memberMapper.updatePw(memberVO);
			// 비밀번호 변경 메일 발송
		
			sendEmail(memberVO, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult) throws Exception{
		
		boolean result = false;
		
		if(bindingResult.hasErrors()){
			result = true;
		} 
		
		if(!memberVO.getMem_pw().equals(memberVO.getMem_pw2())) {
			bindingResult.rejectValue("mem_pw2", "memberVO.mem_pw2.notEqual" );
			result = true;
		}
		
		MemberVO memberVO1 = memberMapper.getMemberId(memberVO);
		if(memberVO1!=null) {
			bindingResult.rejectValue("mem_id", "memberVO.mem_id.isExist");
			result = true;
		}
		
		MemberVO memberVO2 = memberMapper.getMemberPhone(memberVO);
		if(memberVO2!=null) {
			bindingResult.rejectValue("mem_phone", "memberVO.mem_phone.isExist");
			result = true;
		}
		
		MemberVO memberVO3 = memberMapper.getMemberEmail(memberVO);
		if(memberVO3!=null) {
			bindingResult.rejectValue("mem_email", "memberVO.mem_email.isExist");
			result = true;
		}
		return result;

	}
	
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

        String api_key = "";
        String api_secret = "";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "거북이의기적 휴대폰인증 테스트 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }

}
