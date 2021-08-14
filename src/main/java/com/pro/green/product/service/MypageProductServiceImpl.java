package com.pro.green.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pro.green.common.vo.OrderSheet;
import com.pro.green.product.dao.MypageProductDAO;
import com.pro.green.product.vo.CartVO;
import com.pro.green.product.vo.MemberHasCouponVO;

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

	// ��ȸ�� ��ٱ��� ��ȸ
	public List<Map<String, Object>> nonmemberCartList(String productId) throws DataAccessException {
		return mypageProductDAO.nonmemberCartList(productId);
	}

	// ��ȸ�� ��ٱ��� �߰� �� ��ǰ ��� ��ȸ
	public String selectP_stock(String optionId) throws DataAccessException {
		return mypageProductDAO.selectP_stock(optionId);
	}

	// �ֹ����ۼ� ��ȸ
	public List<Map<String, Object>> productOrderList(String optionId) throws DataAccessException {
		return mypageProductDAO.productOrderList(optionId);
	}

	// ���� ���� ���� ���� ��������
	public List<MemberHasCouponVO> memberHasCoupon(String userId) throws DataAccessException {
		return mypageProductDAO.memberHasCoupon(userId);
	}

	// ���� ���� ���� ��ȸ
	public List<Map<String, Object>> hasCouponList(String userId) throws DataAccessException {
		return mypageProductDAO.hasCouponList(userId);
	}

	// ��ٱ��� ���� ��ȸ
	public int cartCount(String id) throws DataAccessException {
		return mypageProductDAO.cartCount(id);
	}

	// ��� �������� �� ���� ��������
	public int dbPrice(OrderSheet orderSheet) throws DataAccessException {
		return mypageProductDAO.dbPrice(orderSheet);
	}

	// �ֹ��� �ۼ�
	public int insertOrder(Map<String, Object> insertBox) throws DataAccessException {
		return mypageProductDAO.insertOrder(insertBox);
	}
}
