package dto;

import lombok.Data;

@Data
public class PageDto {
    private Criteria cri;
    private int total; //게시글 총합
    private int startPage; // 페이지 버튼 시작 번호
    private int endPage; // 페이지 버튼 종료 번호

    private int pageCount; //페이지 버튼갯수;

    public PageDto(int total) {
        this(new Criteria(), total);
    }

    public PageDto(Criteria cri, int total) {
        this(cri, total, 10);
    }

    public PageDto(Criteria cri, int total, int pageCount) {
        this.cri = cri;
        this.total = total;
        this.pageCount = pageCount;
        endPage = (cri.getPage() + pageCount - 1) / pageCount * pageCount;
        startPage = endPage - pageCount + 1;

        int realEnd = (total + cri.getAmount() - 1) / cri.getAmount();
        System.out.println(realEnd);

        if(realEnd < endPage) {
            endPage = realEnd;
        }
    }

    public static void main(String[] args) {
        PageDto dto = new PageDto(new Criteria(8, 10), 255, 10);
        System.out.println(dto);
    }
}