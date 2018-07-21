package com.wesafer.member.service;

import java.util.ArrayList;
import java.util.Random;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wesafer.bean.DelPriBean;
import com.wesafer.bean.InfoBean;
import com.wesafer.bean.LatlngBean;
import com.wesafer.bean.MemberBean;
import com.wesafer.bean.NewsBean;
import com.wesafer.member.mapper.MemberMapper;


@Component
public class MemberService {

		@Autowired
		private MemberMapper memberMapper;
		
		// get members total count
		public int getTotalCnt(){
			return this.memberMapper.getTotalCnt();
		}
		
		// get all members by page
		public ArrayList<MemberBean> getAllMember(String page, String list){
			return this.memberMapper.getAllMember(page, list);
		}
		
		
		// get member by id
		public MemberBean selectById(String userid){
			System.out.println("get member by id");
			return this.memberMapper.selectById(userid);
		}
		
		// ��й�ȣ ã�� : �ش�ȸ�� �̸���, �޴���ȭ��ȣ ���
		public String selectByEmail(String userid){
			return this.memberMapper.GetMemberEmail(userid);
		}
		
		public String selectByPhone(String userid){
			return this.memberMapper.GetMemberPhone(userid);
		}
		
		// �α��� ���� üũ
		public String loginUserCheck(String userid){
			return this.memberMapper.userCheck(userid);
		}
		
		// ��й�ȣ ����
		@Transactional
		public void changePassword(String userid, String psw){
			memberMapper.changePassword(userid, psw);
		}
		
		// ȸ������
		public void deleteMember(String userid){
			memberMapper.deleteMember(userid);
		}
		
		// Ż��ó��
		public void modiActive(String userid){
			memberMapper.modiActive(userid);
		}
		
		// 회원아이디로 활동여부 확인
		public String noneActiveMember(String userid){
			return this.memberMapper.noneActiveMember(userid);
		}
		
		// Ż�𿩺� �̸��Ϸ� Ȯ��
		public String noneActiveMemberByEmail(String email){
			return this.memberMapper.noneActiveMemberByEmail(email);
		}
		
		//ȸ������ ���� 
		public void modiMember(String userid, String name, String phone, String email, String loc, String birth, String nick, String loc2){
			memberMapper.modiMember(userid, name, phone, email, loc, birth, nick, loc2);
		}
		
		// join member
		public void joinMember(String userid, String name, String psw, String phone, String email, String loc, String birth, String nick, String loc2){
			memberMapper.joinMember(userid, name, psw, phone, email, loc, birth, nick, loc2);
		}
		
		// ���̵� �ߺ�Ȯ��
		public String idCheck(String userid){
			return this.memberMapper.idCheck(userid);
		}
		

		// �̸��� Ȯ��
		public String emailCheck(String name, String email){
			return this.memberMapper.emailCheck(name, email);
		}
		
		// ������ ���� ���� �߻�
		public int RandomNum(){
			Random random = new Random();
			int num = random.nextInt(9999)+1111;
			
			return num;
		}
		
		// ��й�ȣ Ȯ��
		public String passwordCheck(String name, String email){
			return this.memberMapper.passwordCheck(name, email);
		}
		
		// 활동현황 게시물 출력
		public ArrayList<InfoBean> myActive(String userid, String page){
			return this.memberMapper.myActive(userid, page);
		}
		
		// insert Clip
		public void insertMyClip(String userid, int idx){
			memberMapper.insertMyClip(userid, idx);
		}
		
		// clip check
		public String clipCheck(String userid, String ono){
			return this.memberMapper.clipCheck(userid, ono);
		}
		
		// ��ũ�� �Խ������� �̵�
		public ArrayList<NewsBean> goMyClip(String userid, String page){
			return this.memberMapper.goMyClip(userid, page);
		}
		
		// 마이페이지 활동현황 전체 게시글 수 출력
		public String mypageCount(String userid){
			return this.memberMapper.mypageCount(userid);
		}
		
		// 마이페이지 스크랩 게시물 수 출력
		public String myclipCount(String userid){
			return this.memberMapper.myclipCount(userid);
		}
		
		// 탈퇴사유 입력
		public void del_pri(String userid, String reason){
			memberMapper.del_pri(userid, reason);
		}
		
		//탈퇴사유삭제
		public void del_pri_delete(String userid){
			memberMapper.del_pri_delete(userid);
		}
		
		// update member active
		public void updateMemberActive(String userid){
			memberMapper.updateMemberActive(userid);
		}
		
		// update member active none
		public void updateMemberActiveNone(String userid){
			memberMapper.updateMemberActiveNone(userid);
		}
		
		// search members by id
		public ArrayList<MemberBean> searchMembersById(String userid, String page){
			return this.memberMapper.searchMembersById(userid, page);
		}
	
		// search members by name
		public ArrayList<MemberBean> searchMembersByName(String name, String page){
			return this.memberMapper.searchMembersByName(name, page);
		}
		
		//search member by id count
		public String searchMemberByIdCount(String userid){
			return this.memberMapper.searchMemberByIdCount(userid);
		}
		
		//search member by name count
		public String searchMemberByNameCount(String name){
			return this.memberMapper.searchMemberByNameCount(name);
		}
		
		// delete member
		public DelPriBean delMember(String userid){
			return this.memberMapper.delMember(userid);
		}
		
		// search myboard
		public ArrayList<InfoBean> searchMyboard(String userid){
			return this.memberMapper.searchMyboard(userid);
		}
		
		public String searchMyboardCount(String userid){
			return this.memberMapper.searchMyboardCount(userid);
		}
		
		public ArrayList<InfoBean> searchMyboardCmt(String userid){
			return this.memberMapper.searchMyboardCmt(userid);
		}
		
		public String searchMyboardCmtCount(String userid){
			return this.memberMapper.searchMyboardCmtCount(userid);
		}
		
		//delete clip
		public void deleteClip(String from_idx){
			
			memberMapper.deleteClip(from_idx);
		}
		
		
}
