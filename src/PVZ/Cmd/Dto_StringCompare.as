package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_StringCompare extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_StringCompare";
      
      public static const EQ:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_StringCompare.eq","eq",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const NE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_StringCompare.ne","ne",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_StringCompare.lt","lt",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_StringCompare.le","le",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_StringCompare.gt","gt",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_StringCompare.ge","ge",6 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var eq$field:String;
      
      private var ne$field:String;
      
      private var lt$field:String;
      
      private var le$field:String;
      
      private var gt$field:String;
      
      private var ge$field:String;
      
      public function Dto_StringCompare()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_StringCompare.$MessageID;
      }
      
      public function clearEq() : void
      {
         this.eq$field = null;
      }
      
      public function get hasEq() : Boolean
      {
         return this.eq$field != null;
      }
      
      public function set eq(param1:String) : void
      {
         this.eq$field = param1;
      }
      
      public function get eq() : String
      {
         return this.eq$field;
      }
      
      public function clearNe() : void
      {
         this.ne$field = null;
      }
      
      public function get hasNe() : Boolean
      {
         return this.ne$field != null;
      }
      
      public function set ne(param1:String) : void
      {
         this.ne$field = param1;
      }
      
      public function get ne() : String
      {
         return this.ne$field;
      }
      
      public function clearLt() : void
      {
         this.lt$field = null;
      }
      
      public function get hasLt() : Boolean
      {
         return this.lt$field != null;
      }
      
      public function set lt(param1:String) : void
      {
         this.lt$field = param1;
      }
      
      public function get lt() : String
      {
         return this.lt$field;
      }
      
      public function clearLe() : void
      {
         this.le$field = null;
      }
      
      public function get hasLe() : Boolean
      {
         return this.le$field != null;
      }
      
      public function set le(param1:String) : void
      {
         this.le$field = param1;
      }
      
      public function get le() : String
      {
         return this.le$field;
      }
      
      public function clearGt() : void
      {
         this.gt$field = null;
      }
      
      public function get hasGt() : Boolean
      {
         return this.gt$field != null;
      }
      
      public function set gt(param1:String) : void
      {
         this.gt$field = param1;
      }
      
      public function get gt() : String
      {
         return this.gt$field;
      }
      
      public function clearGe() : void
      {
         this.ge$field = null;
      }
      
      public function get hasGe() : Boolean
      {
         return this.ge$field != null;
      }
      
      public function set ge(param1:String) : void
      {
         this.ge$field = param1;
      }
      
      public function get ge() : String
      {
         return this.ge$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEq)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.eq$field);
         }
         if(this.hasNe)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.ne$field);
         }
         if(this.hasLt)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.lt$field);
         }
         if(this.hasLe)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.le$field);
         }
         if(this.hasGt)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.gt$field);
         }
         if(this.hasGe)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.ge$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StringCompare.eq cannot be set twice.");
                  }
                  _loc3_++;
                  this.eq = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StringCompare.ne cannot be set twice.");
                  }
                  _loc4_++;
                  this.ne = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StringCompare.lt cannot be set twice.");
                  }
                  _loc5_++;
                  this.lt = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StringCompare.le cannot be set twice.");
                  }
                  _loc6_++;
                  this.le = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StringCompare.gt cannot be set twice.");
                  }
                  _loc7_++;
                  this.gt = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StringCompare.ge cannot be set twice.");
                  }
                  _loc8_++;
                  this.ge = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
