package com.qq.modules.entryIcon.view
{
   import com.qq.modules.entryIcon.EntryIconConst;
   import com.qq.modules.entryIcon.view.components.EntryGroupActivityWindowCE;
   import com.qq.modules.entryIcon.view.components.EntryGroupActivityWindowMediator;
   import com.qq.modules.entryIcon.view.icon.BaseEntryIcon;
   import com.qq.utils.UtilsManager;
   
   public class EntryGroupActivityWindow extends EntryGroupActivityWindowCE
   {
       
      
      private var m_vecIcon:Array;
      
      public function EntryGroupActivityWindow()
      {
         super(EntryGroupActivityWindowMediator);
      }
      
      public function refreshIcon(param1:int, param2:int) : void
      {
         var _loc4_:BaseEntryIcon = null;
         this.m_vecIcon = EntryIconConst.getGroupIconViewByGroupID(param1,param2);
         this.m_vecIcon.sort(BaseEntryIcon.sortByOrder);
         var _loc3_:int = this.m_vecIcon.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this.m_vecIcon[_loc5_];
            tile_list.addChild(_loc4_);
            _loc5_++;
         }
      }
      
      override public function Dispose() : void
      {
         var _loc1_:BaseEntryIcon = null;
         while(this.m_vecIcon.length > 0)
         {
            _loc1_ = this.m_vecIcon.pop();
            UtilsManager.removeFromContainer(_loc1_);
         }
         this.m_vecIcon = null;
         super.Dispose();
      }
   }
}
