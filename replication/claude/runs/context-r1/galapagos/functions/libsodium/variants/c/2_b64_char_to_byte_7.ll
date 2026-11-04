; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
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
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %t4 = alloca i32, align 4
  %t5 = alloca i32, align 4
  %x = alloca i32, align 4
  %t6 = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and3 = and i32 %and, %sub2
  store i32 %and3, ptr %t1, align 4
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %5
  %or6 = or i32 %sub4, %sub5
  %not7 = xor i32 %or6, -1
  %shr8 = lshr i32 %not7, 8
  %and9 = and i32 %shr8, 255
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 71
  %and11 = and i32 %and9, %sub10
  store i32 %and11, ptr %t2, align 4
  %7 = load i32, ptr %u, align 4
  %sub12 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %8
  %or14 = or i32 %sub12, %sub13
  %not15 = xor i32 %or14, -1
  %shr16 = lshr i32 %not15, 8
  %and17 = and i32 %shr16, 255
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and18 = and i32 %and17, %add
  store i32 %and18, ptr %t3, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub19 = sub i32 0, %xor
  %not20 = xor i32 %sub19, -1
  %shr21 = lshr i32 %not20, 8
  %and22 = and i32 %shr21, 62
  store i32 %and22, ptr %t4, align 4
  %11 = load i32, ptr %u, align 4
  %xor23 = xor i32 %11, 47
  %sub24 = sub i32 0, %xor23
  %not25 = xor i32 %sub24, -1
  %shr26 = lshr i32 %not25, 8
  %and27 = and i32 %shr26, 63
  store i32 %and27, ptr %t5, align 4
  %12 = load i32, ptr %t1, align 4
  %not28 = xor i32 %12, -1
  %13 = load i32, ptr %t2, align 4
  %not29 = xor i32 %13, -1
  %and30 = and i32 %not28, %not29
  %14 = load i32, ptr %t3, align 4
  %not31 = xor i32 %14, -1
  %and32 = and i32 %and30, %not31
  %15 = load i32, ptr %t4, align 4
  %not33 = xor i32 %15, -1
  %and34 = and i32 %and32, %not33
  %16 = load i32, ptr %t5, align 4
  %not35 = xor i32 %16, -1
  %and36 = and i32 %and34, %not35
  %not37 = xor i32 %and36, -1
  store i32 %not37, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub38 = sub i32 %17, 1
  %shr39 = lshr i32 %sub38, 8
  %18 = load i32, ptr %u, align 4
  %xor40 = xor i32 %18, 65
  %sub41 = sub i32 0, %xor40
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %shr39, %shr42
  %and44 = and i32 %and43, 255
  store i32 %and44, ptr %t6, align 4
  %19 = load i32, ptr %x, align 4
  %not45 = xor i32 %19, -1
  %20 = load i32, ptr %t6, align 4
  %not46 = xor i32 %20, -1
  %and47 = and i32 %not45, %not46
  %not48 = xor i32 %and47, -1
  ret i32 %not48
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
