; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_1.c"
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
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %and = and i32 %sub, 65280
  %shr = lshr i32 %and, 8
  store i32 %shr, ptr %m26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %and2 = and i32 %sub1, 65280
  %shr3 = lshr i32 %and2, 8
  store i32 %shr3, ptr %m52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %and5 = and i32 %sub4, 65280
  %shr6 = lshr i32 %and5, 8
  store i32 %shr6, ptr %m62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %not = xor i32 %sub7, -1
  %shr8 = lshr i32 %not, 8
  %and9 = and i32 %shr8, 255
  store i32 %and9, ptr %e62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor10 = xor i32 %4, 63
  %sub11 = sub i32 0, %xor10
  %not12 = xor i32 %sub11, -1
  %shr13 = lshr i32 %not12, 8
  %and14 = and i32 %shr13, 255
  store i32 %and14, ptr %e63, align 4
  %5 = load i32, ptr %m26, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and15 = and i32 %5, %add
  %7 = load i32, ptr %m26, align 4
  %not16 = xor i32 %7, -1
  %8 = load i32, ptr %m52, align 4
  %and17 = and i32 %not16, %8
  %9 = load i32, ptr %x.addr, align 4
  %add18 = add i32 %9, 71
  %and19 = and i32 %and17, %add18
  %or = or i32 %and15, %and19
  %10 = load i32, ptr %m52, align 4
  %not20 = xor i32 %10, -1
  %11 = load i32, ptr %m62, align 4
  %and21 = and i32 %not20, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub22 = sub i32 %12, 4
  %and23 = and i32 %and21, %sub22
  %or24 = or i32 %or, %and23
  %13 = load i32, ptr %e62, align 4
  %and25 = and i32 %13, 43
  %or26 = or i32 %or24, %and25
  %14 = load i32, ptr %e63, align 4
  %and27 = and i32 %14, 47
  %or28 = or i32 %or26, %and27
  ret i32 %or28
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
