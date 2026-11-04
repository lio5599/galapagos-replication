; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_6.c"
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
  %s26 = alloca i32, align 4
  %s52 = alloca i32, align 4
  %s62 = alloca i32, align 4
  %n62 = alloca i32, align 4
  %n63 = alloca i32, align 4
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %u = alloca i32, align 4
  %v = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  store i32 %sub, ptr %s26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  store i32 %sub1, ptr %s52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %2, 62
  store i32 %sub2, ptr %s62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub3 = sub i32 0, %xor
  store i32 %sub3, ptr %n62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor4 = xor i32 %4, 63
  %sub5 = sub i32 0, %xor4
  store i32 %sub5, ptr %n63, align 4
  %5 = load i32, ptr %s26, align 4
  %shr = lshr i32 %5, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m26, align 4
  %6 = load i32, ptr %s52, align 4
  %shr6 = lshr i32 %6, 8
  %and7 = and i32 %shr6, 255
  store i32 %and7, ptr %m52, align 4
  %7 = load i32, ptr %s62, align 4
  %shr8 = lshr i32 %7, 8
  %and9 = and i32 %shr8, 255
  store i32 %and9, ptr %m62, align 4
  %8 = load i32, ptr %n62, align 4
  %shr10 = lshr i32 %8, 8
  %not = xor i32 %shr10, -1
  %and11 = and i32 255, %not
  store i32 %and11, ptr %u, align 4
  %9 = load i32, ptr %n63, align 4
  %shr12 = lshr i32 %9, 8
  %not13 = xor i32 %shr12, -1
  %and14 = and i32 255, %not13
  store i32 %and14, ptr %v, align 4
  %10 = load i32, ptr %m26, align 4
  %11 = load i32, ptr %x.addr, align 4
  %add = add i32 %11, 65
  %and15 = and i32 %10, %add
  store i32 %and15, ptr %upper, align 4
  %12 = load i32, ptr %m26, align 4
  %not16 = xor i32 %12, -1
  %and17 = and i32 255, %not16
  %13 = load i32, ptr %m52, align 4
  %and18 = and i32 %and17, %13
  %14 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %14, 71
  %and20 = and i32 %and18, %add19
  store i32 %and20, ptr %lower, align 4
  %15 = load i32, ptr %m52, align 4
  %not21 = xor i32 %15, -1
  %and22 = and i32 255, %not21
  %16 = load i32, ptr %m62, align 4
  %and23 = and i32 %and22, %16
  %17 = load i32, ptr %x.addr, align 4
  %add24 = add i32 %17, -4
  %and25 = and i32 %and23, %add24
  store i32 %and25, ptr %digit, align 4
  %18 = load i32, ptr %upper, align 4
  %19 = load i32, ptr %lower, align 4
  %or = or i32 %18, %19
  %20 = load i32, ptr %digit, align 4
  %or26 = or i32 %or, %20
  %21 = load i32, ptr %u, align 4
  %and27 = and i32 %21, 43
  %or28 = or i32 %or26, %and27
  %22 = load i32, ptr %v, align 4
  %and29 = and i32 %22, 47
  %or30 = or i32 %or28, %and29
  ret i32 %or30
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
