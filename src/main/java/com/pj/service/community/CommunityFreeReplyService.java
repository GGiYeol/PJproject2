package com.pj.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pj.domain.community.CommunityReplyVO;
import com.pj.mapper.community.CommunityReplyMapper;

import lombok.Setter;

public class CommunityFreeReplyService {

	
	@Setter(onMethod_ = @Autowired)
	private CommunityReplyMapper mapper;
	
	public List<CommunityReplyVO> list(Integer boardId){
		
		return mapper.list(boardId);
	}
}
