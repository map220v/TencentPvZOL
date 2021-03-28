package com.qq.modules.spring.model.vo
{
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_SpringRewardBox;
   import com.qq.modules.bag.model.vo.ItemVO;
   
   public class SpringRewardVO
   {
       
      
      private var m_index:uint;
      
      private var m_needScore:uint;
      
      private var m_hasOpen:Boolean;
      
      private var m_vecItem:Vector.<ItemVO>;
      
      public function SpringRewardVO()
      {
         super();
         this.m_vecItem = new Vector.<ItemVO>();
      }
      
      public function parseFromDTO(param1:Dto_SpringRewardBox) : void
      {
         var _loc2_:Dto_IdNum = null;
         this.m_index = param1.index;
         this.m_needScore = param1.needCredits;
         this.m_hasOpen = param1.isOpen;
         this.m_vecItem.length = 0;
         for each(_loc2_ in param1.items)
         {
            this.m_vecItem.push(new ItemVO(_loc2_.id,_loc2_.num));
         }
      }
      
      public function set hasOpen(param1:Boolean) : void
      {
         this.m_hasOpen = param1;
      }
      
      public function get index() : uint
      {
         return this.m_index;
      }
      
      public function get hasOpen() : Boolean
      {
         return this.m_hasOpen;
      }
      
      public function get needScore() : uint
      {
         return this.m_needScore;
      }
      
      public function get items() : Vector.<ItemVO>
      {
         return this.m_vecItem;
      }
   }
}
