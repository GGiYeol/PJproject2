package com.pj.mapper.community;

import java.util.List;

import com.pj.domain.community.CommunityReplyVO;

public interface CommunityReplyMapper {

	
	public List<CommunityReplyVO> list(Integer boardId);
}
