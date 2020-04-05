public class CartDetailsAuraServices {

    private static Coupon__c getCoupon(String Name){
       Coupon__c coupon=[Select Id,Price__c FROM Coupon__c WHERE Name=:Name]; 
        return coupon;
    }
    @AuraEnabled
    public static String getCartId(List<String> beerList){
        List<Cart__c> cartList=getCart();
        if(cartList != null && cartList.size()>0){
            createCartItems(beerList,cartList[0].Id);
           return cartList[0].Id; 
        }else{
            Cart__c cart=new Cart__c(Coupon__c=getCoupon('Default').Id,Cart_Id__c=String.valueOf(Math.random()),Cart_status__c='Open',Is_Active__c=true,User__c=UserInfo.getUserId());
            insert cart;
            createCartItems(beerList,cart.Id);
                return cart.Id;
        }
    }
    
    private static List<Cart__c>getCart(){
        List<Cart__c>cartList=[SELECT Id,Name FROM Cart__c WHERE User__c=:USerInfo.getUserId() AND Is_Active__c=true];
    	return cartList;
    }
    @AuraEnabled
    public static String createCartItems(List<String> beerList,String cartId){
        List<Cart_Item__c>cartItemList=new List<Cart_Item__c>();
        List<Cart_Item__c>cartItemToUpdate=new List<Cart_Item__c>();
     //   String cartId=getCartId();
        Map<Id,Cart_Item__c>beerQntyMap=getCartItems(cartId);
        for(String beer:beerList){
            if(beerQntyMap !=null && beerQntyMap.containsKey(beer)){
                Cart_Item__c it=beerQntyMap.get(beer);
                Cart_Item__c item=new Cart_Item__c(
                    Item_Quantity__c=it.Item_Quantity__c+1,Id=it.Id);
               cartItemToUpdate.add(item); 
            }
            else{
                Integer Qty=1;
                 Cart_Item__c item=new Cart_Item__c(
                Cart__c=cartId,
                 Beer__c=beer,
                 Item_Quantity__c=Qty);
              //   Item_Amount__c=Qty*beer.Price__c
                 
                cartItemList.add(item);
            }
        }
        insert cartItemList;
       if(cartItemToUpdate!=null && cartItemToUpdate.size()>0) 
           update cartItemToUpdate;
        return cartId;
    }
    
    @AuraEnabled
    public static Map<Id,Cart_Item__c>getCartItems(String CartId){
       // if(CartId==null ||CartId=='')
         //   CartId=getCartId();
        List<Cart_Item__c>existingItemList=[SELECT Id,Name,Item_Quantity__c,Beer__c FROM Cart_Item__c WHERE Cart__c=:CartId];
    Map<Id,Cart_Item__c>beerQntyMap= new Map<Id,Cart_Item__c>();
        for(Cart_Item__c item:existingItemList){
            if(!beerQntyMap.containsKey(item.Beer__c)){
                beerQntyMap.put(item.Beer__c,item);
            }
        }
        return beerQntyMap;
    }
}