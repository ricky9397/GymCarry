<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper 
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.project.gymcarry.dao.MemberDao">

	<!-- 멤버회원가입 -->
	<insert id="insertMember"
		parameterType="com.project.gymcarry.member.MemberDto"
		useGeneratedKeys="true" keyProperty="memidx">
		insert into
		member(mememail, mempw,
		memname, memnick, memphone, membirth,
		memgender, memphoto ,joinkey,
		joinkey_status)
		values
		(#{mememail},#{mempw},#{memname},#{memnick},#{memphone},#{membirth},#{memgender},#{memphoto},
		#{joinkey},'0')
	</insert>


	<!-- 캐리회원가입 -->
	<insert id="insertCarry"
		parameterType="com.project.gymcarry.carry.CarryJoinDto"
		useGeneratedKeys="true" keyProperty="cridx">
		insert into carry(cremail,
		crpw,
		crname, crnick, crgender, crphone, crphoto ,joinkey,
		joinkey_status)
		values
		(#{cremail},#{crpw},#{crname},#{crnick},#{crgender},#{crphone},#{crphoto},#{joinkey},
		'0')
	</insert>

	<!-- 멤버 회원가입시 이메일 중복 검사 -->
	<select id="memberemailCheck" parameterType="String"
		resultType="int">
		select count(*) from member where mememail = #{mememail}
	</select>

	<!-- 멤버 회원가입시 닉네임 중복 검사 -->
	<select id="memberNickCheck" parameterType="String"
		resultType="int">
		select count(*) from member where memnick = #{memnick}
	</select>
	
	<!-- 멤버 회원가입시 핸드폰 중복 검사 -->
	<select id="memberPhoneCheck" parameterType="String"
		resultType="int">
		select count(*) from member where memphone = #{memphone} 
	</select>
	
	<!-- 캐리 회원가입시 이메일 중복 검사 -->
	<select id="carryemailCheck" parameterType="String"
		resultType="int">
		select count(*) from carry where cremail = #{cremail}
	</select>

	<!-- 캐리 회원가입시 닉네임 중복 검사 -->
	<select id="carryNickCheck" parameterType="String"
		resultType="int">
		select count(*) from carry where crnick = #{crnick}
	</select>
	
	<!-- 캐리 회원가입시 핸드폰 중복 검사 -->
	<select id="carryPhoneCheck" parameterType="String"
		resultType="int">
		select count(*) from carry where crphone = #{crphone} 
	</select>


	<!-- 멤버로그인 -->
	<!-- 로그인값은 멤버 캐리 상관없이 SessionDto로 받아오기 -->
	<select id="memberLogin" parameterType="String"
		resultType="com.project.gymcarry.member.SessionDto">
		select * from member where mememail=#{param1} and
		mempw=#{param2}
	</select>

	<!-- 캐리로그인 -->
	<select id="carryLogin" parameterType="String"
		resultType="com.project.gymcarry.member.SessionDto">
		select * from carry where cremail=#{param1} and
		crpw=#{param2}
	</select>


	<!-- 로그인시 joinkey_status != 1인 경우(이메일 인증되지 않은 계정) 로그인 제한 -->
	<select id="memberjoinkeycheck" parameterType="String"
		resultType="com.project.gymcarry.member.MemberDto">
		select * from member where mememail = #{param1} and mempw =
		#{param2}
	</select>

	<!-- 로그인시 joinkey_status != 1인 경우(이메일 인증되지 않은 계정) 로그인 제한 -->
	<select id="carryjoinkeycheck" parameterType="String"
		resultType="com.project.gymcarry.carry.CarryDto">
		select * from carry where cremail = #{param1} and crpw =
		#{param2}
	</select>


	<!-- 멤버 회원가입 이메일 인증 -->
	<!-- joinkey -->
	<update id="GetJoinkey" parameterType="String">
		update member set joinkey
		= #{param2} where mememail = #{param1}
	</update>

	<update id="cr_GetJoinkey" parameterType="String">
		update carry set
		joinkey
		= #{param2} where cremail = #{param1}
	</update>


	<!-- joinkey_status = 0 (미인증상태) / 1 (인증상태) -->
	<update id="alterjoinkey" parameterType="Map">
		update member set
		joinkey_status = '1' where mememail = #{param1} and joinkey =
		#{param2}
	</update>

	<!-- joinkey_status = 0 (미인증상태) / 1 (인증상태) -->
	<update id="cr_alterjoinkey" parameterType="Map">
		update carry set
		joinkey_status = '1' where cremail = #{param1} and joinkey =
		#{param2}
	</update>

	<!-- 멤버 아이디 찾기 -->
	<select id="findmemberid"
		parameterType="com.project.gymcarry.dao.MemberDao" resultType="String">
		select
		mememail from member where memname = #{memname} and memphone =
		#{memphone}
	</select>

	<!-- 캐리 아이디 찾기 -->
	<select id="findcarryid"
		parameterType="com.project.gymcarry.dao.MemberDao" resultType="String">
		select
		cremail from carry where crname = #{crname} and crphone = #{crphone}
	</select>

	<!-- 멤버 비밀번호 찾기 -->
	<select id="findPassword"
		parameterType="com.project.gymcarry.dao.MemberDao" resultType="String">
		select
		mememail from member where memname = #{memname} and mememail =
		#{mememail}
	</select>

	<!-- 캐리 비밀번호 찾기 -->
	<select id="findCarryPassword"
		parameterType="com.project.gymcarry.dao.MemberDao" resultType="String">
		select
		cremail from carry where crname = #{crname} and cremail = #{cremail}
	</select>

	<!-- 멤버 임시 비밀번호 업데이트 -->
	<update id="setpassword" parameterType="Map">
		update member set mempw =
		#{param1} where memname = #{param2} and mememail = #{param3}
	</update>

	<!-- 캐리 임시 비밀번호 업데이트 -->
	<update id="setCarrypassword" parameterType="Map">
		update carry set
		crpw =
		#{param1} where crname = #{param2} and cremail = #{param3}
	</update>
	
	
	<!-- 카카오 로그인insert -->
	<insert id="insertKaKaoJoinOne"
		parameterType="com.project.gymcarry.member.MemberJoinDto">
		insert into member(snsjoinid,mememail) 
		values (#{snsjoinid},#{mememail})
	</insert>
	
	<!-- 카카오 로그인 -->
	<select id="selectKakaoLoginCheck" parameterType="String"
		resultType="com.project.gymcarry.member.SessionDto">
		select * from member where snsjoinid = #{param}
	</select>
	
	<!-- sns회원가입 -->
	<update id="updateKakaoJoin" parameterType="String">
		update member set memnick=#{memnick}, memphone=#{memphone} where snsjoinid=#{snsjoinid}
	</update>
	
	
</mapper>