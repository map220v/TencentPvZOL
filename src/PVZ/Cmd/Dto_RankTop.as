package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_RankTop extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RankTop";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_RankTop.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const RANKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankTop.rankValue","rankValue",2 << 3 | WireType.VARINT);
      
      public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RankTop.username","username",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var roleId$field:Int64;
      
      private var rankValue$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var username$field:String;
      
      public function Dto_RankTop()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RankTop.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearRankValue() : void
      {
         this.hasField$0 &= 4294967294;
         this.rankValue$field = new uint();
      }
      
      public function get hasRankValue() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rankValue(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rankValue$field = param1;
      }
      
      public function get rankValue() : uint
      {
         return this.rankValue$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRankValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rankValue$field);
         }
         if(this.hasUsername)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.username$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankTop.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankTop.rankValue cannot be set twice.");
                  }
                  _loc4_++;
                  this.rankValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankTop.username cannot be set twice.");
                  }
                  _loc5_++;
                  this.username = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
