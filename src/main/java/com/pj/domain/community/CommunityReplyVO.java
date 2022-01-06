package com.pj.domain.community;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CommunityReplyVO {

	private Integer id;
	private Integer boardId;
	private String memberId;
	private String reply;
	private LocalDateTime inserted;
	private LocalDateTime updated;
}
