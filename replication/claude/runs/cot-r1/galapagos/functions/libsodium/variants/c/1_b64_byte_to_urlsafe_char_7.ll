; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_byte_to_urlsafe_char.off = internal constant [5 x i32] [i32 65, i32 71, i32 -4, i32 -17, i32 32], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %cmp = icmp uge i32 %0, 26
  %conv = zext i1 %cmp to i32
  %1 = load i32, ptr %x.addr, align 4
  %cmp1 = icmp uge i32 %1, 52
  %conv2 = zext i1 %cmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %2 = load i32, ptr %x.addr, align 4
  %cmp3 = icmp uge i32 %2, 62
  %conv4 = zext i1 %cmp3 to i32
  %add5 = add nsw i32 %add, %conv4
  %3 = load i32, ptr %x.addr, align 4
  %cmp6 = icmp uge i32 %3, 63
  %conv7 = zext i1 %cmp6 to i32
  %add8 = add nsw i32 %add5, %conv7
  %4 = load i32, ptr %x.addr, align 4
  %cmp9 = icmp uge i32 %4, 64
  %conv10 = zext i1 %cmp9 to i32
  %add11 = add nsw i32 %add8, %conv10
  store i32 %add11, ptr %i, align 4
  %5 = load i32, ptr %i, align 4
  %cmp12 = icmp eq i32 %5, 5
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, ptr %x.addr, align 4
  %7 = load i32, ptr %i, align 4
  %idxprom = zext i32 %7 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr @b64_byte_to_urlsafe_char.off, i64 0, i64 %idxprom
  %8 = load i32, ptr %arrayidx, align 4
  %add14 = add nsw i32 %6, %8
  store i32 %add14, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, ptr %retval, align 4
  ret i32 %9
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
