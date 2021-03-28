package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ThanksGiving_GlobalReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ThanksGiving_GlobalReward";
      
      public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ThanksGiving_GlobalReward.username","username",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ITEMS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ThanksGiving_GlobalReward.items","items",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ThanksGiving_RewardItem);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ThanksGiving_GlobalReward.faceId","faceId",3 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ThanksGiving_GlobalReward.qqFaceURL","qqFaceURL",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var username$field:String;
      
      private var items$field:Dto_ThanksGiving_RewardItem;
      
      private var faceId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var qqFaceURL$field:String;
      
      public function Dto_ThanksGiving_GlobalReward()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ThanksGiving_GlobalReward.$MessageID;
      }
      
      public function clearUsername() : void
      {
         this.username$field = null;
      }
      
      public function get hasUsername() : Boolean
      {
         return this.username$field != null;
      }
      
      public function set username(param1:String) : void
      {
         this.username$field = param1;
      }
      
      public function get username() : String
      {
         return this.username$field;
      }
      
      public function clearItems() : void
      {
         this.items$field = null;
      }
      
      public function get hasItems() : Boolean
      {
         return this.items$field != null;
      }
      
      public function set items(param1:Dto_ThanksGiving_RewardItem) : void
      {
         this.items$field = param1;
      }
      
      public function get items() : Dto_ThanksGiving_RewardItem
      {
         return this.items$field;
      }
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967294;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
      }
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasUsername)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.username$field);
         }
         if(this.hasItems)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ThanksGiving_GlobalReward.username cannot be set twice.");
                  }
                  _loc3_++;
                  this.username = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ThanksGiving_GlobalReward.items cannot be set twice.");
                  }
                  _loc4_++;
                  this.items = new Dto_ThanksGiving_RewardItem();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.items);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ThanksGiving_GlobalReward.faceId cannot be set twice.");
                  }
                  _loc5_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ThanksGiving_GlobalReward.qqFaceURL cannot be set twice.");
                  }
                  _loc6_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
