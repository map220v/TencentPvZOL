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
   
   public final class Dto_TempleLordInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TempleLordInfo";
      
      public static const TEMPLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TempleLordInfo.templeId","templeId",1 << 3 | WireType.VARINT);
      
      public static const LORDGUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_TempleLordInfo.lordGuildId","lordGuildId",2 << 3 | WireType.VARINT);
      
      public static const LORDGUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_TempleLordInfo.lordGuildName","lordGuildName",3 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var templeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var lordGuildId$field:Int64;
      
      private var lordGuildName$field:String;
      
      public function Dto_TempleLordInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TempleLordInfo.$MessageID;
      }
      
      public function clearTempleId() : void
      {
         this.hasField$0 &= 4294967294;
         this.templeId$field = new uint();
      }
      
      public function get hasTempleId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set templeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.templeId$field = param1;
      }
      
      public function get templeId() : uint
      {
         return this.templeId$field;
      }
      
      public function clearLordGuildId() : void
      {
         this.lordGuildId$field = null;
      }
      
      public function get hasLordGuildId() : Boolean
      {
         return this.lordGuildId$field != null;
      }
      
      public function set lordGuildId(param1:Int64) : void
      {
         this.lordGuildId$field = param1;
      }
      
      public function get lordGuildId() : Int64
      {
         return this.lordGuildId$field;
      }
      
      public function clearLordGuildName() : void
      {
         this.lordGuildName$field = null;
      }
      
      public function get hasLordGuildName() : Boolean
      {
         return this.lordGuildName$field != null;
      }
      
      public function set lordGuildName(param1:String) : void
      {
         this.lordGuildName$field = param1;
      }
      
      public function get lordGuildName() : String
      {
         return this.lordGuildName$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTempleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.templeId$field);
         }
         if(this.hasLordGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.lordGuildId$field);
         }
         if(this.hasLordGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.lordGuildName$field);
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
                     throw new IOError("Bad data format: Dto_TempleLordInfo.templeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.templeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleLordInfo.lordGuildId cannot be set twice.");
                  }
                  _loc4_++;
                  this.lordGuildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleLordInfo.lordGuildName cannot be set twice.");
                  }
                  _loc5_++;
                  this.lordGuildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
