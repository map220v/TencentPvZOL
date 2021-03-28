package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_PayShop_BuyGoods_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PayShop_BuyGoods_CS";
      
      public static const GOODSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PayShop_BuyGoods_CS.goodsId","goodsId",1 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PayShop_BuyGoods_CS.num","num",2 << 3 | WireType.VARINT);
      
      public static const OPENID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PayShop_BuyGoods_CS.openId","openId",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const OPENKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PayShop_BuyGoods_CS.openKey","openKey",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const PF:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PayShop_BuyGoods_CS.pf","pf",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const PFKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PayShop_BuyGoods_CS.pfKey","pfKey",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GOODSURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PayShop_BuyGoods_CS.goodsUrl","goodsUrl",7 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var goodsId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var num$field:uint;
      
      private var openId$field:String;
      
      private var openKey$field:String;
      
      private var pf$field:String;
      
      private var pfKey$field:String;
      
      private var goodsUrl$field:String;
      
      public function Cmd_PayShop_BuyGoods_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PayShop_BuyGoods_CS.$MessageID;
      }
      
      public function clearGoodsId() : void
      {
         this.hasField$0 &= 4294967294;
         this.goodsId$field = new uint();
      }
      
      public function get hasGoodsId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set goodsId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.goodsId$field = param1;
      }
      
      public function get goodsId() : uint
      {
         return this.goodsId$field;
      }
      
      public function clearNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.num$field = param1;
      }
      
      public function get num() : uint
      {
         return this.num$field;
      }
      
      public function clearOpenId() : void
      {
         this.openId$field = null;
      }
      
      public function get hasOpenId() : Boolean
      {
         return this.openId$field != null;
      }
      
      public function set openId(param1:String) : void
      {
         this.openId$field = param1;
      }
      
      public function get openId() : String
      {
         return this.openId$field;
      }
      
      public function clearOpenKey() : void
      {
         this.openKey$field = null;
      }
      
      public function get hasOpenKey() : Boolean
      {
         return this.openKey$field != null;
      }
      
      public function set openKey(param1:String) : void
      {
         this.openKey$field = param1;
      }
      
      public function get openKey() : String
      {
         return this.openKey$field;
      }
      
      public function clearPf() : void
      {
         this.pf$field = null;
      }
      
      public function get hasPf() : Boolean
      {
         return this.pf$field != null;
      }
      
      public function set pf(param1:String) : void
      {
         this.pf$field = param1;
      }
      
      public function get pf() : String
      {
         return this.pf$field;
      }
      
      public function clearPfKey() : void
      {
         this.pfKey$field = null;
      }
      
      public function get hasPfKey() : Boolean
      {
         return this.pfKey$field != null;
      }
      
      public function set pfKey(param1:String) : void
      {
         this.pfKey$field = param1;
      }
      
      public function get pfKey() : String
      {
         return this.pfKey$field;
      }
      
      public function clearGoodsUrl() : void
      {
         this.goodsUrl$field = null;
      }
      
      public function get hasGoodsUrl() : Boolean
      {
         return this.goodsUrl$field != null;
      }
      
      public function set goodsUrl(param1:String) : void
      {
         this.goodsUrl$field = param1;
      }
      
      public function get goodsUrl() : String
      {
         return this.goodsUrl$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGoodsId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.goodsId$field);
         }
         if(this.hasNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.num$field);
         }
         if(this.hasOpenId)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.openId$field);
         }
         if(this.hasOpenKey)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.openKey$field);
         }
         if(this.hasPf)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.pf$field);
         }
         if(this.hasPfKey)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.pfKey$field);
         }
         if(this.hasGoodsUrl)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.goodsUrl$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_CS.goodsId cannot be set twice.");
                  }
                  _loc3_++;
                  this.goodsId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_CS.num cannot be set twice.");
                  }
                  _loc4_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_CS.openId cannot be set twice.");
                  }
                  _loc5_++;
                  this.openId = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_CS.openKey cannot be set twice.");
                  }
                  _loc6_++;
                  this.openKey = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_CS.pf cannot be set twice.");
                  }
                  _loc7_++;
                  this.pf = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_CS.pfKey cannot be set twice.");
                  }
                  _loc8_++;
                  this.pfKey = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_CS.goodsUrl cannot be set twice.");
                  }
                  _loc9_++;
                  this.goodsUrl = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
