package tencent.tools.group
{
   import flash.utils.Dictionary;
   
   public class GroupManager
   {
      
      private static var _instance:GroupManager;
       
      
      private var groupDic:Dictionary;
      
      private var defaultGroupClass:Class;
      
      public function GroupManager(param1:Lock)
      {
         super();
         this.groupDic = new Dictionary();
      }
      
      public static function getInstance() : GroupManager
      {
         if(!_instance)
         {
            _instance = new GroupManager(new Lock());
         }
         return _instance;
      }
      
      public function setDefaultGroupClass(param1:Class) : void
      {
         this.defaultGroupClass = param1;
      }
      
      public function addToGroup(param1:String, param2:IGroupTarget, param3:Class = null) : void
      {
         if(this.groupDic[param1] == null)
         {
            if(!param3)
            {
               param3 = this.defaultGroupClass;
            }
            this.groupDic[param1] = new param3() as IGroup;
            (this.groupDic[param1] as IGroup).groupId = param1;
         }
         (this.groupDic[param1] as IGroup).add(param2);
      }
      
      public function removeFromGroup(param1:String, param2:IGroupTarget) : void
      {
         var _loc3_:IGroup = this.getGroupFromID(param1);
         if(_loc3_)
         {
            _loc3_.remove(param2);
            if(_loc3_.childNum == 0)
            {
               this.removeGroup(param1);
            }
         }
      }
      
      public function getGroupFromID(param1:String) : IGroup
      {
         return this.groupDic[param1] as IGroup;
      }
      
      public function hasGroup(param1:String) : Boolean
      {
         if(this.groupDic[param1])
         {
            return true;
         }
         return false;
      }
      
      private function removeGroup(param1:String) : void
      {
         if(this.groupDic[param1])
         {
            (this.groupDic[param1] as IGroup).dispose();
         }
         this.groupDic[param1] == null;
      }
   }
}

class Lock
{
    
   
   function Lock()
   {
      super();
   }
}
