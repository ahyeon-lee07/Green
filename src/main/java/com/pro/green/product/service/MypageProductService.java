package com.pro.green.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pro.green.common.vo.OrderSheet;
import com.pro.green.product.vo.CartVO;
import com.pro.green.product.vo.MemberHasCouponVO;

public interface MypageProductService {

	//���ɻ�ǰ ����Ʈ
	public List<Map<String, Object>> wishList(Map<String, Object> selectOption) throws DataAccessException;

	//���ɻ�ǰ ����
	public int wishDelete(Map<String, Object> selectOption) throws DataAccessException;

	//�������̺� ��� ����
	public int wishYN(Map<String, Object> addOption) throws DataAccessException;

	//��ٱ��� ���
	public int cartAdd(Map<String, Object> option) throws DataAccessException;

	//��ٱ��� ����Ʈ ��ȸ
	public List<Map<String, Object>> cartList(String id) throws DataAccessException;

	//��ٱ��� ����
	public int cartDelete(Map<String, Object> option) throws DataAccessException;

	//��ٱ��� ���� ����
	public int stockChange(Map<String, Object> option) throws DataAccessException;

	//��ȸ�� ��ٱ��� ��ȸ
	public List<Map<String, Object>> nonmemberCartList(String productId) throws DataAccessException;

	//��ȸ�� ��ٱ��� �߰� �� ��ǰ ��� ��ȸ
	public String selectP_stock(String optionId) throws DataAccessException;

	//�ֹ����ۼ� ��ȸ
	public List<Map<String, Object>> productOrderList(String optionId) throws DataAccessException;

	//���� ���� ���� ���� ��������
	public List<MemberHasCouponVO> memberHasCoupon(String userId) throws DataAccessException;

	//���� ���� ���� ��ȸ
	public List<Map<String, Object>> hasCouponList(String userId) throws DataAccessException;

	//��ٱ��� ���� ��ȸ
	public int cartCount(String id) throws DataAccessException;

	//��� �������� �� ���� ��������
	public int dbPrice(OrderSheet orderSheet) throws DataAccessException;

	//�ֹ��� �ۼ�
	public int insertOrder(Map<String, Object> insertBox) throws DataAccessException;


}
