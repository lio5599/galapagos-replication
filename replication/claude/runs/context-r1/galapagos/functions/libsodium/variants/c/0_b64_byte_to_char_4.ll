; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_4.c"
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
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %e62 = alloca i32, align 4
  %e63 = alloca i32, align 4
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %t4 = alloca i32, align 4
  %t5 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %m52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %m62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 %and9, 255
  store i32 %xor10, ptr %e62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %e63, align 4
  %5 = load i32, ptr %m26, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and16 = and i32 %5, %add
  store i32 %and16, ptr %t1, align 4
  %7 = load i32, ptr %m26, align 4
  %not = xor i32 %7, -1
  %8 = load i32, ptr %m52, align 4
  %and17 = and i32 %not, %8
  %9 = load i32, ptr %x.addr, align 4
  %add18 = add i32 %9, 71
  %and19 = and i32 %and17, %add18
  store i32 %and19, ptr %t2, align 4
  %10 = load i32, ptr %m52, align 4
  %not20 = xor i32 %10, -1
  %11 = load i32, ptr %m62, align 4
  %and21 = and i32 %not20, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub22 = sub i32 %12, 4
  %and23 = and i32 %and21, %sub22
  store i32 %and23, ptr %t3, align 4
  %13 = load i32, ptr %e62, align 4
  %and24 = and i32 %13, 43
  store i32 %and24, ptr %t4, align 4
  %14 = load i32, ptr %e63, align 4
  %and25 = and i32 %14, 47
  store i32 %and25, ptr %t5, align 4
  %15 = load i32, ptr %t1, align 4
  %not26 = xor i32 %15, -1
  %16 = load i32, ptr %t2, align 4
  %not27 = xor i32 %16, -1
  %and28 = and i32 %not26, %not27
  %17 = load i32, ptr %t3, align 4
  %not29 = xor i32 %17, -1
  %and30 = and i32 %and28, %not29
  %18 = load i32, ptr %t4, align 4
  %not31 = xor i32 %18, -1
  %and32 = and i32 %and30, %not31
  %19 = load i32, ptr %t5, align 4
  %not33 = xor i32 %19, -1
  %and34 = and i32 %and32, %not33
  %not35 = xor i32 %and34, -1
  ret i32 %not35
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
