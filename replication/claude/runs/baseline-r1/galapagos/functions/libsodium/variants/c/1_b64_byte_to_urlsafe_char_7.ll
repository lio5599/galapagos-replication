; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.c"
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
  %lt = alloca [3 x i32], align 4
  %eq = alloca [2 x i32], align 4
  %r = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %arrayidx = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 0
  store i32 %and, ptr %arrayidx, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 1
  store i32 %and3, ptr %arrayidx4, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %2, 62
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %shr6, 255
  %arrayidx8 = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 2
  store i32 %and7, ptr %arrayidx8, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub9 = sub i32 0, %xor
  %shr10 = lshr i32 %sub9, 8
  %and11 = and i32 %shr10, 255
  %xor12 = xor i32 %and11, 255
  %arrayidx13 = getelementptr inbounds [2 x i32], ptr %eq, i64 0, i64 0
  store i32 %xor12, ptr %arrayidx13, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %4, 63
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %xor18 = xor i32 %and17, 255
  %arrayidx19 = getelementptr inbounds [2 x i32], ptr %eq, i64 0, i64 1
  store i32 %xor18, ptr %arrayidx19, align 4
  %arrayidx20 = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 0
  %5 = load i32, ptr %arrayidx20, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and21 = and i32 %5, %add
  store i32 %and21, ptr %r, align 4
  %arrayidx22 = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 0
  %7 = load i32, ptr %arrayidx22, align 4
  %xor23 = xor i32 %7, 255
  %arrayidx24 = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 1
  %8 = load i32, ptr %arrayidx24, align 4
  %and25 = and i32 %xor23, %8
  %9 = load i32, ptr %x.addr, align 4
  %add26 = add i32 %9, 71
  %and27 = and i32 %and25, %add26
  %10 = load i32, ptr %r, align 4
  %or = or i32 %10, %and27
  store i32 %or, ptr %r, align 4
  %arrayidx28 = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 1
  %11 = load i32, ptr %arrayidx28, align 4
  %xor29 = xor i32 %11, 255
  %arrayidx30 = getelementptr inbounds [3 x i32], ptr %lt, i64 0, i64 2
  %12 = load i32, ptr %arrayidx30, align 4
  %and31 = and i32 %xor29, %12
  %13 = load i32, ptr %x.addr, align 4
  %add32 = add i32 %13, -4
  %and33 = and i32 %and31, %add32
  %14 = load i32, ptr %r, align 4
  %or34 = or i32 %14, %and33
  store i32 %or34, ptr %r, align 4
  %arrayidx35 = getelementptr inbounds [2 x i32], ptr %eq, i64 0, i64 0
  %15 = load i32, ptr %arrayidx35, align 4
  %and36 = and i32 %15, 45
  %16 = load i32, ptr %r, align 4
  %or37 = or i32 %16, %and36
  store i32 %or37, ptr %r, align 4
  %arrayidx38 = getelementptr inbounds [2 x i32], ptr %eq, i64 0, i64 1
  %17 = load i32, ptr %arrayidx38, align 4
  %and39 = and i32 %17, 95
  %18 = load i32, ptr %r, align 4
  %or40 = or i32 %18, %and39
  store i32 %or40, ptr %r, align 4
  %19 = load i32, ptr %r, align 4
  ret i32 %19
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
