package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightReward";
      
      public static const CHANGETYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_FightReward.changeType","changeType",1 << 3 | WireType.VARINT,E_FightRewardChangeType);
      
      public static const ISFIRSTFULLSTAR:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FightReward.isFirstFullStar","isFirstFullStar",2 << 3 | WireType.VARINT);
      
      public static const KILLREWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightReward.killRewardList","killRewardList",3 << 3 | WireType.LENGTH_DELIMITED,Dto_KillReward);
      
      public static const REWARDITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightReward.rewardItem","rewardItem",4 << 3 | WireType.LENGTH_DELIMITED,Dto_ItemInfo);
       
      
      private var changeType$field:int;
      
      private var hasField$0:uint = 0;
      
      private var isFirstFullStar$field:Boolean;
      
      public var killRewardList:Array;
      
      public var rewardItem:Array;
      
      public function Dto_FightReward()
      {
         this.killRewardList = [];
         this.rewardItem = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightReward.$MessageID;
      }
      
      public function clearChangeType() : void
      {
         this.hasField$0 &= 4294967294;
         this.changeType$field = new int();
      }
      
      public function get hasChangeType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set changeType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.changeType$field = param1;
      }
      
      public function get changeType() : int
      {
         return this.changeType$field;
      }
      
      public function clearIsFirstFullStar() : void
      {
         this.hasField$0 &= 4294967293;
         this.isFirstFullStar$field = new Boolean();
      }
      
      public function get hasIsFirstFullStar() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isFirstFullStar(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isFirstFullStar$field = param1;
      }
      
      public function get isFirstFullStar() : Boolean
      {
         return this.isFirstFullStar$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasChangeType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.changeType$field);
         }
         if(this.hasIsFirstFullStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isFirstFullStar$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.killRewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.killRewardList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.rewardItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItem[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReward.changeType cannot be set twice.");
                  }
                  _loc3_++;
                  this.changeType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReward.isFirstFullStar cannot be set twice.");
                  }
                  _loc4_++;
                  this.isFirstFullStar = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  this.killRewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_KillReward()));
                  break;
               case 4:
                  this.rewardItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ItemInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
