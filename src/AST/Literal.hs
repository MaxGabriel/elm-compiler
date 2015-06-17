{-# OPTIONS_GHC -Wall #-}
module AST.Literal where

import qualified Data.Map as Map
import qualified Text.PrettyPrint as P

import qualified Reporting.PrettyPrint as P


data Literal
    = IntNum Int
    | FloatNum Double
    | Chr Char
    | Str String
    | Boolean Bool
    deriving (Eq, Ord, Show)


instance P.Pretty Literal where
  pretty _ _ literal =
    case literal of
      IntNum n -> P.int n
      FloatNum n -> P.double n
      Chr c -> P.text . show $ c
      Str s -> P.text . show $ s
      Boolean bool -> P.text (show bool)


data GLTipe
    = Int
    | Float
    | V2
    | V3
    | V4
    | M4
    | Texture
    deriving (Show)


glTipeName :: GLTipe -> String
glTipeName glTipe =
    case glTipe of
      Int     -> "Int"
      Float   -> "Float"
      V2      -> "Math.Vector2.Vec2"
      V3      -> "Math.Vector3.Vec3"
      V4      -> "Math.Vector4.Vec4"
      M4      -> "Math.Matrix4.Mat4"
      Texture -> "WebGL.Texture"


data GLShaderTipe = GLShaderTipe
    { attribute :: Map.Map String GLTipe
    , uniform :: Map.Map String GLTipe
    , varying :: Map.Map String GLTipe
    }
    deriving (Show)
