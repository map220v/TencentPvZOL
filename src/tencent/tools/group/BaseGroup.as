package tencent.tools.group
{
   public class BaseGroup implements IGroup
   {
       
      
      protected var groupID:String;
      
      protected var radioBoxVec:Vector.<IGroupTarget>;
      
      private var _childNum:int = 0;
      
      public function BaseGroup()
      {
         super();
         this.radioBoxVec = new Vector.<IGroupTarget>();
      }
      
      public function set groupId(param1:String) : void
      {
         this.groupID = this.groupID;
      }
      
      public function add(param1:IGroupTarget) : void
      {
         var _loc2_:Boolean = false;
         if(!this.radioBoxVec)
         {
            this.radioBoxVec = new Vector.<IGroupTarget>();
         }
         var _loc3_:int = this.radioBoxVec.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.radioBoxVec[_loc4_] === param1)
            {
               _loc2_ = true;
               _loc4_ = _loc3_;
            }
            _loc4_++;
         }
         if(!_loc2_)
         {
            this.radioBoxVec[_loc3_] = param1;
            ++this._childNum;
         }
      }
      
      public function remove(param1:IGroupTarget) : void
      {
         var _loc2_:int = this.radioBoxVec.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.radioBoxVec[_loc3_] === param1)
            {
               this.radioBoxVec.splice(_loc3_,1);
               --this._childNum;
               return;
            }
            _loc3_++;
         }
      }
      
      public function get childNum() : int
      {
         return this._childNum;
      }
      
      public function dispose() : void
      {
         this.radioBoxVec = null;
      }
   }
}
