package org.nulljump.dionysos.common;

public class Paging {
	// �� �������� ����� ������� ������ �����ϴ� ��ü
	private int startRow;
	private int endRow;
	private int listCount; // �� ��� ��
	private int limit; // �� �������� ����� ��ϼ�
	private int currentPage; // ����� ������
	private int maxPage; // �� ������ ��
	private int startPage; //�������׷��� ���۰�
	private int endPage;  //�������׷��� ����

	//������ ����
	
	public Paging(int listCount, int currentPage, int limit) {
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.limit = limit;
	}

	public void calculator() {
		// ������ �� ���
		// ���� : ����� 11���̸� ������ ���� 2�������� ��
		// ������ ��� 1���� �� �������� �ʿ���
		maxPage = (int) ((double) listCount / limit + 0.95);
		// ���� �������� ���Ե� ������ �׷��� ���۰��� ���� ���
		// => �� ������ �Ʒ��ʿ� ǥ���� ������ ���ڸ� 10�� �Ѵٸ�
		// ���� �������� 95��� 91�� 100 �� ����� ��
		startPage = ((currentPage - 1) / 10) * 10 + 1;
		endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// �������� ������ ���� �������� ����� ����� �������
		// ������ ���
		startRow = (currentPage - 1) * limit + 1;
		endRow = startRow + limit - 1;		
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "Paging [startRow=" + startRow + ", endRow=" + endRow + ", listCount=" + listCount + ", limit=" + limit
				+ ", currentPage=" + currentPage + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	

}
