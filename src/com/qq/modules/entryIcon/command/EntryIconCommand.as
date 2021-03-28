package com.qq.modules.entryIcon.command
{
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.entryIcon.EntryIconConst;
   import com.qq.modules.entryIcon.model.ActivityIconVO;
   import com.qq.modules.entryIcon.model.EntryIconModel;
   import com.qq.modules.entryIcon.model.SystemIconVO;
   import com.qq.modules.entryIcon.model.templates.ActivityIconTemplate;
   import com.qq.modules.entryIcon.model.templates.EntryIconTemplateFactory;
   import com.qq.modules.entryIcon.model.templates.SystemIconTemplate;
   import com.qq.modules.entryIcon.view.EntryGroupActivityWindow;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class EntryIconCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "EntryIconCommand";
       
      
      [Inject]
      public var entryModel:EntryIconModel;
      
      public function EntryIconCommand()
      {
         super();
      }
      
      public function addActivityIcon(param1:int, param2:Function = null, param3:Array = null, param4:Boolean = false) : void
      {
         var _loc5_:ActivityIconVO = null;
         if(this.entryModel.addActivityIcon(param1,param2,param3,param4))
         {
            if((_loc5_ = this.entryModel.getActivityIcon(param1)).template != null && _loc5_.hasGroup)
            {
               this.addGroupIconByGroupID(EntryIconConst.TYPE_ACTIVITY_ICON,_loc5_.template.groupID);
            }
            dispatch(new CommonEvent(EntryIconConst.EVENT_ADD_ACTIVITY_ICON,param1));
         }
      }
      
      private function addGroupIconByGroupID(param1:int, param2:int) : void
      {
         var _loc3_:ActivityIconTemplate = null;
         var _loc4_:SystemIconTemplate = null;
         if(param1 == EntryIconConst.TYPE_ACTIVITY_ICON)
         {
            _loc3_ = EntryIconTemplateFactory.instance.getActivityIconTemplate(param2);
            this.addActivityIcon(param2,this.openGroupIconWin,[param1,param2,_loc3_.desc],true);
         }
         else
         {
            _loc4_ = EntryIconTemplateFactory.instance.getSystemIconTemplate(param2);
            this.addSystemIcon(param2,this.openGroupIconWin,[param1,param2,_loc4_.desc],true);
         }
      }
      
      public function addSystemIcon(param1:int, param2:Function = null, param3:Array = null, param4:Boolean = false) : void
      {
         var _loc5_:SystemIconVO = null;
         if(this.entryModel.addSystemIcon(param1,param2,param3,param4))
         {
            if((_loc5_ = this.entryModel.getSystemIcon(param1)).template != null && _loc5_.hasGroup)
            {
               this.addGroupIconByGroupID(EntryIconConst.TYPE_SYSTEM_ICON,_loc5_.template.groupID);
            }
            dispatch(new CommonEvent(EntryIconConst.EVENT_ADD_SYSTEM_ICON,param1));
         }
      }
      
      public function removeActivityIcon(param1:int) : void
      {
         if(this.entryModel.removeActivityIcon(param1))
         {
            dispatch(new CommonEvent(EntryIconConst.EVENT_REMOVE_ACTIVITY_ICON,param1));
         }
      }
      
      public function removeSystemIcon(param1:int) : void
      {
         if(this.entryModel.removeSystemIcon(param1))
         {
            dispatch(new CommonEvent(EntryIconConst.EVENT_REMOVE_SYSTEM_ICON,param1));
         }
      }
      
      public function changeActivityEffect(param1:int, param2:Boolean) : void
      {
         if(this.entryModel.hasActivityIcon(param1))
         {
            this.entryModel.getActivityIcon(param1).needEffect = param2;
            dispatch(new CommonEvent(EntryIconConst.EVENT_ACTIVITY_EFFECT_CHANGE,param1));
         }
      }
      
      public function changeSystemEffect(param1:int, param2:Boolean) : void
      {
         if(this.entryModel.hasSystemIcon(param1))
         {
            this.entryModel.getSystemIcon(param1).needEffect = param2;
            dispatch(new CommonEvent(EntryIconConst.EVENT_SYSTEM_EFFECT_CHANGE,param1));
         }
      }
      
      public function changeIconEffect(param1:int, param2:Boolean) : void
      {
         this.changeActivityEffect(param1,param2);
         this.changeSystemEffect(param1,param2);
      }
      
      public function openGroupIconWin(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:EntryGroupActivityWindow;
         (_loc4_ = new EntryGroupActivityWindow()).reset([param1,param2,param3]);
         PopUpManager.AddPopUp(_loc4_,null,true);
      }
   }
}
