package com.pro.green.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.product.dao.MypageProductDAO;
import com.pro.green.product.vo.CartVO;

@Service("mypageProductService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageProductServiceImpl implements MypageProductService {

	@Autowired
	private MypageProductDAO mypageProductDAO;

	// ���ɻ�ǰ ����Ʈ
	@Override
	public List<Map<String, Object>> wishList(Map<String, Object> selectOption) throws DataAccessException {
		return mypageProductDAO.wishList(selectOption);
	}

	// ���ɻ�ǰ ����
	@Override
	public int wishDelete(Map<String, Object> selectOption) throws DataAccessException {
		return mypageProductDAO.wishDelete(selectOption);
	}

	// �������̺� ��� ����
	public int wishYN(Map<String, Object> addOption) throws DataAccessException {
		return mypageProductDAO.wishYN(addOption);
	}

	// ��ٱ��� ���
	public int cartAdd(Map<String, Object> option) throws DataAccessException {
		return mypageProductDAO.cartAdd(option);
	}

	// ��ٱ��� ����Ʈ ��ȸ
	public List<Map<String, Object>> cartList(String id) throws DataAccessException {
		return mypageProductDAO.cartList(id);
	}

	// ��ٱ��� ����
	public int cartDelete(Map<String, Object> option) throws DataAccessException {
		return mypageProductDAO.cartDelete(option);
	}

	// ��ٱ��� ���� ����
	public int stockChange(Map<String, Object> option) throws DataAccessException {
		return mypageProductDAO.stockChange(option);
	}
}
