package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MysteryCard extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MysteryCard";
      
      public static const WEEKLYCARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MysteryCard.weeklyCard","weeklyCard",1 << 3 | WireType.VARINT);
      
      public static const DAILYCARD:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MysteryCard.dailyCard","dailyCard",2 << 3 | WireType.VARINT);
      
      public static const REFRESHNEEDITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_MysteryCard.refreshNeedItem","refreshNeedItem",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var weeklyCard$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var dailyCard:Array;
      
      private var refreshNeedItem$field:Dto_IdNum;
      
      public function Dto_MysteryCard()
      {
         this.dailyCard = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MysteryCard.$MessageID;
      }
      
      public function clearWeeklyCard() : void
      {
         this.hasField$0 &= 4294967294;
         this.weeklyCard$field = new uint();
      }
      
      public function get hasWeeklyCard() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set weeklyCard(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.weeklyCard$field = param1;
      }
      
      public function get weeklyCard() : uint
      {
         return this.weeklyCard$field;
      }
      
      public function clearRefreshNeedItem() : void
      {
         this.refreshNeedItem$field = null;
      }
      
      public function get hasRefreshNeedItem() : Boolean
      {
         return this.refreshNeedItem$field != null;
      }
      
      public function set refreshNeedItem(param1:Dto_IdNum) : void
      {
         this.refreshNeedItem$field = param1;
      }
      
      public function get refreshNeedItem() : Dto_IdNum
      {
         return this.refreshNeedItem$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasWeeklyCard)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.weeklyCard$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.dailyCard.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyCard[_loc2_]);
            _loc2_++;
         }
         if(this.hasRefreshNeedItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.refreshNeedItem$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_MysteryCard.weeklyCard cannot be set twice.");
                  }
                  _loc3_++;
                  this.weeklyCard = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if((_loc5_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.dailyCard);
                  }
                  else
                  {
                     this.dailyCard.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MysteryCard.refreshNeedItem cannot be set twice.");
                  }
                  _loc4_++;
                  this.refreshNeedItem = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.refreshNeedItem);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
