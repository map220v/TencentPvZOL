package com.qq.modules.levelselect.view.components
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.model.vo.LSChallengeScoreRankVO;
   import com.qq.utils.IconUtil;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LSLevelWdRankRoleCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSLevelWdRankRoleCell;
      
      private var dto:LSChallengeScoreRankVO;
      
      public function LSLevelWdRankRoleCellMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         this.view.addEventListener(Event.CHANGE,this.onChangeHandler);
         this.view.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         this.view.dispatchEvent(new Event(Event.SELECT));
      }
      
      protected function onChangeHandler(param1:Event) : void
      {
         this.dto = this.view.data as LSChallengeScoreRankVO;
         this.view.rank.text = (this.dto.rank + 1).toString();
         this.view.txtName.text = this.dto.roleName;
         this.view.score.text = this.dto.score.toString();
         this.view.txtLv.text = this.dto.level.toString();
         this.view.headIcon.source = IconUtil.getFaceIcon(this.view.headIcon,this.dto.faceId,this.dto.QQFaceUrl);
         if(this.dto.rank > 2)
         {
            (this.view.headMask.mcHolder as MovieClip).gotoAndStop(1);
         }
         else
         {
            (this.view.headMask.mcHolder as MovieClip).gotoAndStop(this.dto.rank + 2);
         }
      }
   }
}
