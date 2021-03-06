package bit.it.into.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import bit.it.into.dto.AccountDTO;
import bit.it.into.dto.MemberDTO;

public interface UserMapper {

	public int updateUserToken(@Param("member_num")int member_num, @Param("access_token")String access_token, @Param("refresh_token")String refresh_token, @Param("user_seq_no")String user_seq_no);

	public int insertAccount(AccountDTO accountDTO);

	public List<Integer> selectAllMemberNum();
	
	public String selectPwdEmail(String id);

	public void updatePwd(Map<String, String> userInfo);

	public Integer selectIdEmail(Map<String, String> info);

	public List<MemberDTO> selectIdInfo(String email);

	public void updateNickname(MemberDTO dto);

	public void updatePhone(MemberDTO dto);

	public void updateId(MemberDTO dto);

	public void updateEmail(MemberDTO dto);
	
	public void updatePw(MemberDTO dto);
	
	public void deleteAuthorities(int member_num);

	public void deleteStock(int member_num);

	public void deleteCalculator(int member_num);

	public void deleteBond(int member_num);

	public void deleteRank(int member_num);

	public void deleteAccount(int member_num);

	public void deleteMember(int member_num);

	public void deleteSubsribe(int member_num);

	public void deleteSalaryAccount(int member_num);

}
