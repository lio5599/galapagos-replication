; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %e62 = alloca i32, align 4
  %e63 = alloca i32, align 4
  %r = alloca i32, align 4
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
  %and8 = and i32 %sub7, 65280
  %shr9 = lshr i32 %and8, 8
  %xor10 = xor i32 %shr9, 255
  store i32 %xor10, ptr %e62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %and13 = and i32 %sub12, 65280
  %shr14 = lshr i32 %and13, 8
  %xor15 = xor i32 %shr14, 255
  store i32 %xor15, ptr %e63, align 4
  store i32 0, ptr %r, align 4
  %5 = load i32, ptr %m26, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and16 = and i32 %5, %add
  %7 = load i32, ptr %r, align 4
  %or = or i32 %7, %and16
  store i32 %or, ptr %r, align 4
  %8 = load i32, ptr %m26, align 4
  %xor17 = xor i32 %8, 255
  %9 = load i32, ptr %m52, align 4
  %and18 = and i32 %xor17, %9
  %10 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %10, 71
  %and20 = and i32 %and18, %add19
  %11 = load i32, ptr %r, align 4
  %or21 = or i32 %11, %and20
  store i32 %or21, ptr %r, align 4
  %12 = load i32, ptr %m52, align 4
  %xor22 = xor i32 %12, 255
  %13 = load i32, ptr %m62, align 4
  %and23 = and i32 %xor22, %13
  %14 = load i32, ptr %x.addr, align 4
  %add24 = add i32 %14, -4
  %and25 = and i32 %and23, %add24
  %15 = load i32, ptr %r, align 4
  %or26 = or i32 %15, %and25
  store i32 %or26, ptr %r, align 4
  %16 = load i32, ptr %e62, align 4
  %and27 = and i32 %16, 45
  %17 = load i32, ptr %r, align 4
  %or28 = or i32 %17, %and27
  store i32 %or28, ptr %r, align 4
  %18 = load i32, ptr %e63, align 4
  %and29 = and i32 %18, 95
  %19 = load i32, ptr %r, align 4
  %or30 = or i32 %19, %and29
  store i32 %or30, ptr %r, align 4
  %20 = load i32, ptr %r, align 4
  ret i32 %20
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
