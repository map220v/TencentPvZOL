package tencent.tools.group
{
   public interface IGroup
   {
       
      
      function set groupId(param1:String) : void;
      
      function add(param1:IGroupTarget) : void;
      
      function remove(param1:IGroupTarget) : void;
      
      function get childNum() : int;
      
      function dispose() : void;
   }
}
