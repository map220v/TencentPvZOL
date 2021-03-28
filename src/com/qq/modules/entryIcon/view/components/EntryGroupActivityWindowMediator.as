package com.qq.modules.entryIcon.view.components
{
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.entryIcon.model.EntryIconModel;
   import com.qq.modules.entryIcon.view.EntryGroupActivityWindow;
   
   public class EntryGroupActivityWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:EntryGroupActivityWindow;
      
      [Inject]
      public var entryModel:EntryIconModel;
      
      private var _type:int;
      
      public function EntryGroupActivityWindowMediator()
      {
         super();
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         if(param1 == null)
         {
            return;
         }
         this._type = int(param1[0]);
         var _loc2_:int = int(param1[1]);
         this.view.title = String(param1[2]);
         this.view.refreshIcon(this._type,_loc2_);
      }
      
      override public function dispose() : void
      {
         PopUpManager.RemovePopUp(this.view);
         super.dispose();
      }
   }
}
