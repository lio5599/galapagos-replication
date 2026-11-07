; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %upper_mask = alloca i32, align 4
  %lower_mask = alloca i32, align 4
  %digit_mask = alloca i32, align 4
  %plus_mask = alloca i32, align 4
  %slash_mask = alloca i32, align 4
  %x = alloca i32, align 4
  %zero_mask = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %and = and i32 %shr, 255
  %sub2 = sub i32 255, %and
  store i32 %sub2, ptr %upper_mask, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %4
  %or5 = or i32 %sub3, %sub4
  %shr6 = lshr i32 %or5, 8
  %and7 = and i32 %shr6, 255
  %sub8 = sub i32 255, %and7
  store i32 %sub8, ptr %lower_mask, align 4
  %5 = load i32, ptr %u, align 4
  %sub9 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 57, %6
  %or11 = or i32 %sub9, %sub10
  %shr12 = lshr i32 %or11, 8
  %and13 = and i32 %shr12, 255
  %sub14 = sub i32 255, %and13
  store i32 %sub14, ptr %digit_mask, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub15 = sub i32 0, %xor
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %sub18 = sub i32 255, %and17
  store i32 %sub18, ptr %plus_mask, align 4
  %8 = load i32, ptr %u, align 4
  %xor19 = xor i32 %8, 47
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %sub23 = sub i32 255, %and22
  store i32 %sub23, ptr %slash_mask, align 4
  %9 = load i32, ptr %upper_mask, align 4
  %10 = load i32, ptr %u, align 4
  %sub24 = sub i32 %10, 65
  %and25 = and i32 %9, %sub24
  %11 = load i32, ptr %lower_mask, align 4
  %12 = load i32, ptr %u, align 4
  %sub26 = sub i32 %12, 71
  %and27 = and i32 %11, %sub26
  %or28 = or i32 %and25, %and27
  %13 = load i32, ptr %digit_mask, align 4
  %14 = load i32, ptr %u, align 4
  %sub29 = sub i32 %14, -4
  %and30 = and i32 %13, %sub29
  %or31 = or i32 %or28, %and30
  %15 = load i32, ptr %plus_mask, align 4
  %and32 = and i32 %15, 62
  %or33 = or i32 %or31, %and32
  %16 = load i32, ptr %slash_mask, align 4
  %and34 = and i32 %16, 63
  %or35 = or i32 %or33, %and34
  store i32 %or35, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub36 = sub i32 0, %17
  %shr37 = lshr i32 %sub36, 8
  %and38 = and i32 %shr37, 255
  %sub39 = sub i32 255, %and38
  store i32 %sub39, ptr %zero_mask, align 4
  %18 = load i32, ptr %x, align 4
  %19 = load i32, ptr %zero_mask, align 4
  %20 = load i32, ptr %u, align 4
  %xor40 = xor i32 %20, 65
  %sub41 = sub i32 0, %xor40
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %shr42, 255
  %and44 = and i32 %19, %and43
  %or45 = or i32 %18, %and44
  ret i32 %or45
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
