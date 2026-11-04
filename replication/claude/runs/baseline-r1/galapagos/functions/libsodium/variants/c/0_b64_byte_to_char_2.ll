; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %conv = trunc i32 %shr to i8
  %conv1 = zext i8 %conv to i32
  store i32 %conv1, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %1, 52
  %shr3 = lshr i32 %sub2, 8
  %conv4 = trunc i32 %shr3 to i8
  %conv5 = zext i8 %conv4 to i32
  store i32 %conv5, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub6 = sub i32 %2, 62
  %shr7 = lshr i32 %sub6, 8
  %conv8 = trunc i32 %shr7 to i8
  %conv9 = zext i8 %conv8 to i32
  store i32 %conv9, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub10 = sub i32 0, %xor
  %shr11 = lshr i32 %sub10, 8
  %not = xor i32 %shr11, -1
  %conv12 = trunc i32 %not to i8
  %conv13 = zext i8 %conv12 to i32
  store i32 %conv13, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %4, 63
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %not17 = xor i32 %shr16, -1
  %conv18 = trunc i32 %not17 to i8
  %conv19 = zext i8 %conv18 to i32
  store i32 %conv19, ptr %e, align 4
  %5 = load i32, ptr %e, align 4
  %and = and i32 %5, 47
  %6 = load i32, ptr %d, align 4
  %and20 = and i32 %6, 43
  %or = or i32 %and, %and20
  %7 = load i32, ptr %b, align 4
  %not21 = xor i32 %7, -1
  %conv22 = trunc i32 %not21 to i8
  %conv23 = zext i8 %conv22 to i32
  %8 = load i32, ptr %c, align 4
  %and24 = and i32 %conv23, %8
  %9 = load i32, ptr %x.addr, align 4
  %add = add i32 %9, -4
  %and25 = and i32 %and24, %add
  %or26 = or i32 %or, %and25
  %10 = load i32, ptr %a, align 4
  %not27 = xor i32 %10, -1
  %conv28 = trunc i32 %not27 to i8
  %conv29 = zext i8 %conv28 to i32
  %11 = load i32, ptr %b, align 4
  %and30 = and i32 %conv29, %11
  %12 = load i32, ptr %x.addr, align 4
  %add31 = add i32 %12, 71
  %and32 = and i32 %and30, %add31
  %or33 = or i32 %or26, %and32
  %13 = load i32, ptr %a, align 4
  %14 = load i32, ptr %x.addr, align 4
  %add34 = add i32 %14, 65
  %and35 = and i32 %13, %add34
  %or36 = or i32 %or33, %and35
  ret i32 %or36
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
