; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 65
  %shr = lshr i32 %sub1, 8
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %3
  %shr3 = lshr i32 %sub2, 8
  %or = or i32 %shr, %shr3
  %not = xor i32 %or, -1
  %and = and i32 %sub, %not
  %and4 = and i32 %and, 255
  store i32 %and4, ptr %x, align 4
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 %4, 71
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 97
  %shr7 = lshr i32 %sub6, 8
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 122, %6
  %shr9 = lshr i32 %sub8, 8
  %or10 = or i32 %shr7, %shr9
  %not11 = xor i32 %or10, -1
  %and12 = and i32 %sub5, %not11
  %and13 = and i32 %and12, 255
  %7 = load i32, ptr %x, align 4
  %or14 = or i32 %7, %and13
  store i32 %or14, ptr %x, align 4
  %8 = load i32, ptr %u, align 4
  %sub15 = sub i32 %8, -4
  %9 = load i32, ptr %u, align 4
  %sub16 = sub i32 %9, 48
  %shr17 = lshr i32 %sub16, 8
  %10 = load i32, ptr %u, align 4
  %sub18 = sub i32 57, %10
  %shr19 = lshr i32 %sub18, 8
  %or20 = or i32 %shr17, %shr19
  %not21 = xor i32 %or20, -1
  %and22 = and i32 %sub15, %not21
  %and23 = and i32 %and22, 255
  %11 = load i32, ptr %x, align 4
  %or24 = or i32 %11, %and23
  store i32 %or24, ptr %x, align 4
  %12 = load i32, ptr %u, align 4
  %xor = xor i32 %12, 43
  %sub25 = sub i32 0, %xor
  %shr26 = lshr i32 %sub25, 8
  %not27 = xor i32 %shr26, -1
  %and28 = and i32 62, %not27
  %13 = load i32, ptr %x, align 4
  %or29 = or i32 %13, %and28
  store i32 %or29, ptr %x, align 4
  %14 = load i32, ptr %u, align 4
  %xor30 = xor i32 %14, 47
  %sub31 = sub i32 0, %xor30
  %shr32 = lshr i32 %sub31, 8
  %not33 = xor i32 %shr32, -1
  %and34 = and i32 63, %not33
  %15 = load i32, ptr %x, align 4
  %or35 = or i32 %15, %and34
  store i32 %or35, ptr %x, align 4
  %16 = load i32, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub36 = sub i32 0, %17
  %shr37 = lshr i32 %sub36, 8
  %not38 = xor i32 %shr37, -1
  %and39 = and i32 255, %not38
  %18 = load i32, ptr %u, align 4
  %xor40 = xor i32 %18, 65
  %sub41 = sub i32 0, %xor40
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %and39, %shr42
  %or44 = or i32 %16, %and43
  ret i32 %or44
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
