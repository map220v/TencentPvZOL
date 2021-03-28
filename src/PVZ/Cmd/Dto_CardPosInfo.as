package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.UInt64;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardPosInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardPosInfo";
      
      public static const POSINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardPosInfo.posIndex","posIndex",1 << 3 | WireType.VARINT);
      
      public static const UID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_CardPosInfo.uid","uid",2 << 3 | WireType.VARINT);
      
      public static const OWNERROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_CardPosInfo.ownerRoleId","ownerRoleId",3 << 3 | WireType.VARINT);
      
      public static const CURHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_CardPosInfo.curHp","curHp",4 << 3 | WireType.VARINT);
      
      public static const MAXHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_CardPosInfo.maxHp","maxHp",5 << 3 | WireType.VARINT);
      
      public static const POWERELE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CardPosInfo.powerEle","powerEle",6 << 3 | WireType.LENGTH_DELIMITED,Dto_CardPower);
       
      
      private var posIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var uid$field:Int64;
      
      private var ownerRoleId$field:Int64;
      
      private var curHp$field:UInt64;
      
      private var maxHp$field:UInt64;
      
      public var powerEle:Array;
      
      public function Dto_CardPosInfo()
      {
         this.powerEle = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardPosInfo.$MessageID;
      }
      
      public function clearPosIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.posIndex$field = new uint();
      }
      
      public function get hasPosIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set posIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.posIndex$field = param1;
      }
      
      public function get posIndex() : uint
      {
         return this.posIndex$field;
      }
      
      public function clearUid() : void
      {
         this.uid$field = null;
      }
      
      public function get hasUid() : Boolean
      {
         return this.uid$field != null;
      }
      
      public function set uid(param1:Int64) : void
      {
         this.uid$field = param1;
      }
      
      public function get uid() : Int64
      {
         return this.uid$field;
      }
      
      public function clearOwnerRoleId() : void
      {
         this.ownerRoleId$field = null;
      }
      
      public function get hasOwnerRoleId() : Boolean
      {
         return this.ownerRoleId$field != null;
      }
      
      public function set ownerRoleId(param1:Int64) : void
      {
         this.ownerRoleId$field = param1;
      }
      
      public function get ownerRoleId() : Int64
      {
         return this.ownerRoleId$field;
      }
      
      public function clearCurHp() : void
      {
         this.curHp$field = null;
      }
      
      public function get hasCurHp() : Boolean
      {
         return this.curHp$field != null;
      }
      
      public function set curHp(param1:UInt64) : void
      {
         this.curHp$field = param1;
      }
      
      public function get curHp() : UInt64
      {
         return this.curHp$field;
      }
      
      public function clearMaxHp() : void
      {
         this.maxHp$field = null;
      }
      
      public function get hasMaxHp() : Boolean
      {
         return this.maxHp$field != null;
      }
      
      public function set maxHp(param1:UInt64) : void
      {
         this.maxHp$field = param1;
      }
      
      public function get maxHp() : UInt64
      {
         return this.maxHp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPosIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.posIndex$field);
         }
         if(this.hasUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.uid$field);
         }
         if(this.hasOwnerRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.ownerRoleId$field);
         }
         if(this.hasCurHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT64(param1,this.curHp$field);
         }
         if(this.hasMaxHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT64(param1,this.maxHp$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.powerEle.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.powerEle[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardPosInfo.posIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.posIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardPosInfo.uid cannot be set twice.");
                  }
                  _loc4_++;
                  this.uid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardPosInfo.ownerRoleId cannot be set twice.");
                  }
                  _loc5_++;
                  this.ownerRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardPosInfo.curHp cannot be set twice.");
                  }
                  _loc6_++;
                  this.curHp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardPosInfo.maxHp cannot be set twice.");
                  }
                  _loc7_++;
                  this.maxHp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 6:
                  this.powerEle.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardPower()));
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
