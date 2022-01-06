package com.pj.mapper.community;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pj.domain.community.CommunityFreeBoardVO;

public interface CommunityFreeBoardMapper {

	public List<CommunityFreeBoardVO> getList();
	
	public int insert(CommunityFreeBoardVO comFreeBoard);
	
	public CommunityFreeBoardVO read(Integer id);
	
	public int delete(Integer id);
	
	public int update(CommunityFreeBoardVO comFreeBoard);

	public List<CommunityFreeBoardVO> getListPage(@Param("from")Integer from, @Param("items") Integer numberPerPage,
												  @Param("keyword") String keyword);

	public Integer getCountRows();
}
