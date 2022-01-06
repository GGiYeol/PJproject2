package com.pj.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.domain.community.CommunityFreeBoardVO;
import com.pj.domain.community.CommunityPageInfoVO;
import com.pj.mapper.community.CommunityFreeBoardMapper;

import lombok.Setter;

@Service
public class CommunityFreeBoardService {

	
	@Setter(onMethod_ = @Autowired)
	private CommunityFreeBoardMapper mapper;
	
	public boolean register(CommunityFreeBoardVO comFreeBoard) {
		return mapper.insert(comFreeBoard) == 1;
	}
	
	public CommunityFreeBoardVO get(Integer id) {
		return mapper.read(id);

	}
	
	public boolean modify(CommunityFreeBoardVO comFreeBoard) {
		return mapper.update(comFreeBoard) == 1;
	}
	
	public boolean remove(Integer id) {
		return mapper.delete(id) == 1;
	}
	
	public List<CommunityFreeBoardVO> getList(){
		return mapper.getList();
	}

	public List<CommunityFreeBoardVO> getListPage(Integer page, Integer numberPerPage, String keyword) {
		// TODO Auto-generated method stub
		Integer from = (page - 1) * 10;
		
		return mapper.getListPage(from, numberPerPage, keyword);
	}

	public CommunityPageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		// 총 게시물 수
				Integer countRows = mapper.getCountRows();

				// 마지막 페이지 번호
				Integer lastPage = (countRows - 1) / numberPerPage + 1;

				// 페이지네이션 가장 왼쪽 번호
				Integer leftPageNumber = (page - 1) / 10 * 10 + 1;

				// 페이지네이션 가장 오른쪽 번호
				Integer rightPageNumber = (page - 1) / 10 * 10 + 10;
				// 가장 마지막 페이지를 넘어가지 않도록
				rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;

				// 이전 페이지 버튼 존재 유무
				Boolean hasPrevButton = leftPageNumber != 1;

				// 다음 페이지 버튼 존재 유무
				Boolean hasNextButton = rightPageNumber != lastPage;

				CommunityPageInfoVO pageInfo = new CommunityPageInfoVO();

				pageInfo.setLastPage(lastPage);
				pageInfo.setCountRows(countRows);
				pageInfo.setCurrentPage(page);
				pageInfo.setLeftPageNumber(leftPageNumber);
				pageInfo.setRightPageNumber(rightPageNumber);
				pageInfo.setHasPrevButton(hasPrevButton);
				pageInfo.setHasNextButton(hasNextButton);

				return pageInfo;
	}
	
	

}
