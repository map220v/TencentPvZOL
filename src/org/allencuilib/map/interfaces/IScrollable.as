package org.allencuilib.map.interfaces
{
   public interface IScrollable
   {
       
      
      function get maxScrollX() : int;
      
      function get maxScrollY() : int;
      
      function get minScrollX() : int;
      
      function get minScrollY() : int;
      
      function get scrollX() : int;
      
      function set scrollX(param1:int) : void;
      
      function get scrollY() : int;
      
      function set scrollY(param1:int) : void;
      
      function get autoScroll() : Boolean;
      
      function set autoScroll(param1:Boolean) : void;
   }
}
