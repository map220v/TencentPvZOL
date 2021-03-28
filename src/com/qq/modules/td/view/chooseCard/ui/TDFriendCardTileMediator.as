package com.qq.modules.td.view.chooseCard.ui
{
   import PVZ.Cmd.FriendType;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.vo.TDDataVO;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.IconUtil;
   import com.qq.utils.UrlManager;
   
   public class TDFriendCardTileMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var tdData:TDDataVO;
      
      [Inject]
      public var view:TDFriendCardTile;
      
      public function TDFriendCardTileMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         super.reset(param1);
         var _loc2_:TDBasicChooseCard = param1 as TDBasicChooseCard;
         this.view.canvas_card.addChild(_loc2_);
         this.view.label_name.text = _loc2_.cardData.friendInfoData.name;
         this.view.label_passStage.text = FontNormal.TD_Str_PassLevelNum + _loc2_.cardData.friendInfoData.passTDNum;
         this.view.image_friendIcon.source = IconUtil.getFaceIcon(this.view.image_friendIcon,_loc2_.cardData.friendInfoData.faceId,_loc2_.cardData.friendInfoData.qqFaceURL,30);
         if(_loc2_.cardData.friendInfoData.type == FriendType.FRIEND_TYPE_RANDOM)
         {
            _loc3_ = UrlManager.getInstance().getUrl(UrlManager.Url_TDUIIcon,"random.png");
         }
         else if((_loc4_ = _loc2_.cardData.friendInfoData.rank) >= 1 && _loc4_ <= 3)
         {
            _loc3_ = UrlManager.getInstance().getUrl(UrlManager.Url_TDUIIcon,"rank" + _loc4_ + ".png");
         }
         if(_loc3_ != null)
         {
            this.view.image_flag.source = _loc3_;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
