package pack1;
public class CartItem 
{
    public String p_id;
    public String p_name;
    public String mrp;
    public String offer_price;
    public int Qty;
    public String desc;
    public String photo;

    public CartItem(String p_id, String p_name, String mrp, String offer_price, int Qty, String desc, String photo) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.mrp = mrp;
        this.offer_price = offer_price;
        this.Qty = Qty;
        this.desc = desc;
        this.photo = photo;
    }
    }
