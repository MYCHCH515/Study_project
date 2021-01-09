package com.ch.s1.member;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

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
