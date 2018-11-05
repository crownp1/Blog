package Entity;

public class ArticleType {
	
	private int id;//类型编号
	
    private String type;//文章类型

    private int count;//每一类型文章数量

	public ArticleType() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ArticleType(String type, int count,int id) {
		super();
		this.setType(type);
		this.setCount(count);
		this.setId(id);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ArticleType [type=" + type + ", count=" + count +", id="+ id+"]";
	}
    
    
}
